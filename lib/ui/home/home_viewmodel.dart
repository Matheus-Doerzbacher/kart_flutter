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

  Temporada? _temporadaAtual;
  Temporada? get temporadaAtual => _temporadaAtual;

  List<Piloto>? _pilotosDaTemporada;
  List<Piloto>? get pilotosDaTemporada => _pilotosDaTemporada;

  List<Corrida>? _corridasDaTemporada;
  List<Corrida>? get corridasDaTemporada => _corridasDaTemporada;

  int? _participantesDaTemporada;
  int? get participantesDaTemporada => _participantesDaTemporada;

  // COMMANDS
  late final getData = Command0(_getData);

  AsyncResult<Unit> _getData() async {
    _temporadaAtual =
        await _temporadaRepository.getTemporadaAtual().getOrThrow();

    _pilotosDaTemporada =
        await _pilotoRepository
            .getPilotosDaTemporada(_temporadaAtual!.idTemporada!)
            .getOrThrow();

    _corridasDaTemporada =
        await _corridaRepository
            .getCorridasDaTemporada(_temporadaAtual!.idTemporada!)
            .getOrThrow();

    _participantesDaTemporada =
        await _temporadaRepository
            .getParticipantesDaTemporada(_temporadaAtual!.idTemporada!)
            .getOrThrow();

    return const Success(unit);
  }
}
