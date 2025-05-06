import 'dart:convert';

import 'package:kart_flutter/data/service/core/http_service.dart';
import 'package:kart_flutter/domain/models/piloto/piloto.dart';
import 'package:result_dart/result_dart.dart';

class PilotoService {
  final HttpService _httpService;

  PilotoService({required HttpService httpService})
    : _httpService = httpService;

  AsyncResult<List<Piloto>> getPilotosDaTemporada(int idTemporada) async {
    final result = await _httpService.get('/pilotos/temporada/$idTemporada');
    return result.fold((json) {
      final data = jsonDecode(json) as List<dynamic>;
      final pilotos = data.map((e) => Piloto.fromJson(e)).toList();
      return Success(pilotos);
    }, Failure.new);
  }
}
