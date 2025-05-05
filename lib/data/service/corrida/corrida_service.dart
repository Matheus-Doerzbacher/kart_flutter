import 'dart:convert';

import 'package:kart_flutter/data/service/client_http.dart';
import 'package:kart_flutter/domain/models/corrida/corrida.dart';
import 'package:result_dart/result_dart.dart';

class CorridaService {
  final ClientHttp _clientHttp;

  CorridaService({required ClientHttp clientHttp}) : _clientHttp = clientHttp;

  AsyncResult<List<Corrida>> getCorridasDaTemporada(int idTemporada) async {
    final result = await _clientHttp.get('/corridas/temporada/$idTemporada');

    return result.fold((json) {
      final data = jsonDecode(json) as List<dynamic>;
      return Success(data.map((e) => Corrida.fromJson(e)).toList());
    }, Failure.new);
  }
}
