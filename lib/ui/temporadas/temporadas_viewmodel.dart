import 'package:flutter/material.dart';
import 'package:kart_flutter/data/repository/corrida_repository.dart';
import 'package:kart_flutter/data/repository/piloto_repository.dart';
import 'package:kart_flutter/data/repository/temporada_repository.dart';
import 'package:kart_flutter/domain/models/corrida/corrida.dart';
import 'package:kart_flutter/domain/models/piloto/piloto.dart';
import 'package:kart_flutter/domain/models/temporada/temporada.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class TemporadasViewmodel extends ChangeNotifier {
  final TemporadaRepository _temporadaRepository;
  final PilotoRepository _pilotoRepository;
  final CorridaRepository _corridaRepository;

  TemporadasViewmodel({
    required TemporadaRepository temporadaRepository,
    required PilotoRepository pilotoRepository,
    required CorridaRepository corridaRepository,
  }) : _temporadaRepository = temporadaRepository,
       _pilotoRepository = pilotoRepository,
       _corridaRepository = corridaRepository;

  final List<Temporada> _temporadas = [];
  List<Temporada> get temporadas => _temporadas;

  Temporada? _temporadaSelecionada;
  Temporada? get temporadaSelecionada => _temporadaSelecionada;
  set temporadaSelecionada(Temporada? value) {
    _temporadaSelecionada = value;
    notifyListeners();
  }

  List<Piloto>? _pilotosDaTemporada;
  List<Piloto>? get pilotosDaTemporada => _pilotosDaTemporada;

  List<Corrida>? _corridasDaTemporada;
  List<Corrida>? get corridasDaTemporada => _corridasDaTemporada;

  // Comandos
  late final fetchTemporadas = Command1(_fetchTemporadas);
  late final atualizarTemporadaSelecionada = Command1(
    _atualizarTemporadaSelecionada,
  );
  late final upsertTemporada = Command1(_upsertTemporada);
  late final deleteTemporada = Command1(_deleteTemporada);

  Future<void> ajustarTemporadaAtual(Temporada temporadaAtual) async {
    for (final temporada in _temporadas) {
      if (temporada.idTemporada != temporadaAtual.idTemporada &&
          temporada.isTemporadaAtual) {
        final updated = temporada.copyWith(isTemporadaAtual: false);
        final index = _temporadas.indexOf(temporada);
        _temporadas[index] = updated;
        await upsertTemporada.execute(updated);
      }
    }
    notifyListeners();
  }

  AsyncResult<Unit> _atualizarTemporadaSelecionada(Temporada temporada) async {
    _temporadaSelecionada = temporada;

    _pilotosDaTemporada =
        await _pilotoRepository
            .getPilotosDaTemporada(temporada.idTemporada!)
            .getOrThrow();
    _pilotosDaTemporada!.sort(
      (a, b) => (a.temporadaAtual?.posicao ?? 0).compareTo(
        b.temporadaAtual?.posicao ?? 0,
      ),
    );

    _corridasDaTemporada =
        await _corridaRepository
            .getCorridasDaTemporada(_temporadaSelecionada!.idTemporada!)
            .getOrThrow();
    notifyListeners();
    return const Success(unit);
  }

  AsyncResult<Unit> _fetchTemporadas(int idTemporada) async {
    final result = await _temporadaRepository.getTemporadas().getOrThrow();

    _temporadas
      ..clear()
      ..addAll(result)
      ..sort((a, b) => b.ano.compareTo(a.ano));

    await _atualizarTemporadaSelecionada(
      _temporadas.firstWhere((t) => t.idTemporada == idTemporada),
    );
    return const Success(unit);
  }

  AsyncResult<Unit> _upsertTemporada(Temporada temporada) async {
    if (temporada.idTemporada == null) {
      final result = await _temporadaRepository.insertTemporada(temporada);
      return result.fold((temporada) {
        _temporadas.add(temporada);
        notifyListeners();
        return const Success(unit);
      }, Failure.new);
    } else {
      final result = await _temporadaRepository.updateTemporada(temporada);
      return result.fold((temporada) async {
        final index = _temporadas.indexWhere(
          (t) => t.idTemporada == temporada.idTemporada,
        );
        _temporadas[index] = temporada;
        _temporadas.sort((a, b) => b.ano.compareTo(a.ano));
        _temporadaSelecionada = temporada;

        if (temporada.isTemporadaAtual) {
          await ajustarTemporadaAtual(temporada);
        }
        notifyListeners();
        return const Success(unit);
      }, Failure.new);
    }
  }

  AsyncResult<Unit> _deleteTemporada(int idTemporada) async {
    final result = await _temporadaRepository.deleteTemporada(idTemporada);

    return result.fold((result) async {
      _temporadas.removeWhere((t) => t.idTemporada == idTemporada);
      await atualizarTemporadaSelecionada.execute(_temporadas.first);
      notifyListeners();
      return const Success(unit);
    }, Failure.new);
  }
}
