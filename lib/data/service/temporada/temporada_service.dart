import 'dart:convert';

import 'package:kart_flutter/data/service/client_http.dart';
import 'package:kart_flutter/domain/models/temporada/temporada.dart';
import 'package:logging/logging.dart';
import 'package:result_dart/result_dart.dart';

class TemporadaService {
  final ClientHttp _clientHttp;

  TemporadaService({required ClientHttp clientHttp}) : _clientHttp = clientHttp;

  final _log = Logger('TemporadaService');

  AsyncResult<List<Temporada>> getTemporadas() async {
    try {
      final response = await _clientHttp.get('/temporadas');
      return response.fold((responseBody) {
        final data = jsonDecode(responseBody) as List<dynamic>;
        return Success(data.map((e) => Temporada.fromJson(e)).toList());
      }, Failure.new);
    } catch (e) {
      _log.severe('Erro ao buscar temporadas', e);
      return Failure(Exception(e));
    }
  }

  AsyncResult<Temporada> getTemporadaAtual() async {
    try {
      final response = await _clientHttp.get('/temporadas/atual');
      return response.fold((responseBody) {
        final data = jsonDecode(responseBody) as Map<String, dynamic>;
        return Success(Temporada.fromJson(data));
      }, Failure.new);
    } catch (e) {
      _log.severe('Erro ao buscar temporada atual', e);
      return Failure(Exception(e));
    }
  }

  AsyncResult<int> getParticipantesDaTemporada(int idTemporada) async {
    try {
      final response = await _clientHttp.get(
        '/temporadas/$idTemporada/participantes',
      );
      return response.fold((responseBody) {
        final data = jsonDecode(responseBody) as int;
        return Success(data);
      }, Failure.new);
    } catch (e) {
      _log.severe('Erro ao buscar participantes da temporada', e);
      return Failure(Exception(e));
    }
  }
}
