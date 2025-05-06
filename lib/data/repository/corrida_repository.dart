import 'package:kart_flutter/data/service/corrida_service.dart';
import 'package:kart_flutter/domain/models/corrida/corrida.dart';
import 'package:result_dart/result_dart.dart';

class CorridaRepository {
  final CorridaService _corridaService;

  CorridaRepository({required CorridaService corridaService})
    : _corridaService = corridaService;

  AsyncResult<List<Corrida>> getCorridasDaTemporada(int idTemporada) async {
    return _corridaService.getCorridasDaTemporada(idTemporada);
  }
}
