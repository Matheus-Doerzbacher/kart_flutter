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

  late final fetchTemporadas = Command1(_fetchTemporadas);
  late final atualizarTemporadaSelecionada = Command1(
    _atualizarTemporadaSelecionada,
  );
  Future<void> _atualizarDados(Temporada temporada) async {
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
  }

  AsyncResult<Unit> _atualizarTemporadaSelecionada(Temporada temporada) async {
    _temporadaSelecionada = temporada;
    await _atualizarDados(temporada);
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
}
