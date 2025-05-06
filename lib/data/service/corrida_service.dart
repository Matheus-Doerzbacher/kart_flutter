import 'dart:convert';

import 'package:kart_flutter/data/service/core/http_service.dart';
import 'package:kart_flutter/domain/models/corrida/corrida.dart';
import 'package:result_dart/result_dart.dart';

class CorridaService {
  final HttpService _httpService;

  CorridaService({required HttpService httpService})
    : _httpService = httpService;

  AsyncResult<List<Corrida>> getCorridasDaTemporada(int idTemporada) async {
    final result = await _httpService.get('/corridas/temporada/$idTemporada');

    return result.fold((json) {
      final data = jsonDecode(json) as List<dynamic>;
      return Success(data.map((e) => Corrida.fromJson(e)).toList());
    }, Failure.new);
  }
}
