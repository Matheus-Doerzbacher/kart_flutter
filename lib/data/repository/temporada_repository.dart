import 'package:kart_flutter/data/service/temporada/temporada_service.dart';
import 'package:kart_flutter/domain/models/temporada/temporada.dart';
import 'package:result_dart/result_dart.dart';

class TemporadaRepository {
  final TemporadaService _temporadaService;

  TemporadaRepository({required TemporadaService temporadaService})
    : _temporadaService = temporadaService;

  AsyncResult<List<Temporada>> getTemporadas() async {
    return _temporadaService.getTemporadas();
  }

  AsyncResult<Temporada> getTemporadaAtual() async {
    return _temporadaService.getTemporadaAtual();
  }

  AsyncResult<int> getParticipantesDaTemporada(int idTemporada) async {
    return _temporadaService.getParticipantesDaTemporada(idTemporada);
  }

  AsyncResult<Temporada> insertTemporada(Temporada temporada) async {
    return _temporadaService.insertTemporada(temporada);
  }

  AsyncResult<Temporada> updateTemporada(Temporada temporada) async {
    return _temporadaService.updateTemporada(temporada);
  }

  AsyncResult<Unit> deleteTemporada(int idTemporada) async {
    return _temporadaService.deleteTemporada(idTemporada);
  }
}
