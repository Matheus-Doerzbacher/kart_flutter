import 'package:kart_flutter/data/service/piloto/piloto_service.dart';
import 'package:kart_flutter/domain/models/piloto/piloto.dart';
import 'package:result_dart/result_dart.dart';

class PilotoRepository {
  final PilotoService _pilotoService;

  PilotoRepository({required PilotoService pilotoService})
    : _pilotoService = pilotoService;

  AsyncResult<List<Piloto>> getPilotosDaTemporada(int idTemporada) async {
    return _pilotoService.getPilotosDaTemporada(idTemporada);
  }
}
