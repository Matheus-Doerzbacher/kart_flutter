import 'dart:convert';

import 'package:kart_flutter/data/service/client_http.dart';
import 'package:kart_flutter/domain/models/piloto/piloto.dart';
import 'package:result_dart/result_dart.dart';

class PilotoService {
  final ClientHttp _clientHttp;

  PilotoService({required ClientHttp clientHttp}) : _clientHttp = clientHttp;

  AsyncResult<List<Piloto>> getPilotosDaTemporada(int idTemporada) async {
    final result = await _clientHttp.get('/pilotos/temporada/$idTemporada');
    return result.fold((json) {
      final data = jsonDecode(json) as List<dynamic>;
      final pilotos = data.map((e) => Piloto.fromJson(e)).toList();
      return Success(pilotos);
    }, Failure.new);
  }
}
