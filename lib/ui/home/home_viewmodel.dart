import 'package:flutter/cupertino.dart';
import 'package:kart_flutter/data/repository/corrida_repository.dart';
import 'package:kart_flutter/data/repository/piloto_repository.dart';
import 'package:kart_flutter/data/repository/temporada_repository.dart';
import 'package:kart_flutter/domain/models/corrida/corrida.dart';
import 'package:kart_flutter/domain/models/piloto/piloto.dart';
import 'package:kart_flutter/domain/models/temporada/temporada.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class HomeViewModel extends ChangeNotifier {
  final TemporadaRepository _temporadaRepository;
  final PilotoRepository _pilotoRepository;
  final CorridaRepository _corridaRepository;

  HomeViewModel({
    required TemporadaRepository temporadaRepository,
    required PilotoRepository pilotoRepository,
    required CorridaRepository corridaRepository,
  }) : _temporadaRepository = temporadaRepository,
       _pilotoRepository = pilotoRepository,
       _corridaRepository = corridaRepository;

  List<Temporada>? _temporadas;
  List<Temporada>? get temporadas => _temporadas;

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

  int? _participantesDaTemporada;
  int? get participantesDaTemporada => _participantesDaTemporada;

  // COMMANDS
  late final getData = Command0(_getData);
  late final getTemporada = Command1(_getTemporada);

  Future<void> _atualizarDados(Temporada temporada) async {
    _pilotosDaTemporada =
        await _pilotoRepository
            .getPilotosDaTemporada(temporada.idTemporada!)
            .getOrThrow();

    _corridasDaTemporada =
        await _corridaRepository
            .getCorridasDaTemporada(_temporadaSelecionada!.idTemporada!)
            .getOrThrow();

    _participantesDaTemporada =
        await _temporadaRepository
            .getParticipantesDaTemporada(_temporadaSelecionada!.idTemporada!)
            .getOrThrow();
  }

  AsyncResult<Unit> _getTemporada(Temporada temporada) async {
    _temporadaSelecionada = temporada;
    await _atualizarDados(_temporadaSelecionada!);
    return const Success(unit);
  }

  AsyncResult<Unit> _getData() async {
    _temporadas = await _temporadaRepository.getTemporadas().getOrThrow();
    await _getTemporada(_temporadas!.firstWhere((t) => t.isTemporadaAtual));
    return const Success(unit);
  }
}
