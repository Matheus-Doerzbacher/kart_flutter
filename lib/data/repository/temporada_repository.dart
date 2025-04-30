import 'package:kart_flutter/data/service/temporada_service.dart';
import 'package:kart_flutter/domain/models/temporada/temporada.dart';
import 'package:result_dart/result_dart.dart';

class TemporadaRepository {
  final TemporadaService _temporadaService;

  TemporadaRepository({required TemporadaService temporadaService})
    : _temporadaService = temporadaService;

  AsyncResult<List<Temporada>> getTemporadas() async {
    return _temporadaService.getTemporadas();
  }
}
