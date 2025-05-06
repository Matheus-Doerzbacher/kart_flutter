import 'dart:convert';

import 'package:kart_flutter/data/service/core/http_service.dart';
import 'package:kart_flutter/domain/models/temporada/temporada.dart';
import 'package:logging/logging.dart';
import 'package:result_dart/result_dart.dart';

class TemporadaService {
  final HttpService _httpService;

  TemporadaService({required HttpService httpService})
    : _httpService = httpService;

  final _log = Logger('TemporadaService');

  AsyncResult<List<Temporada>> getTemporadas() async {
    try {
      final response = await _httpService.get('/temporadas');
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
      final response = await _httpService.get('/temporadas/atual');
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
      final response = await _httpService.get(
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

  AsyncResult<Temporada> insertTemporada(Temporada temporada) async {
    try {
      final response = await _httpService.post(
        '/temporadas/',
        temporada.toJson(),
      );
      return response.fold((responseBody) {
        final data = jsonDecode(responseBody) as Map<String, dynamic>;
        return Success(Temporada.fromJson(data));
      }, Failure.new);
    } catch (e) {
      _log.severe('Erro ao inserir temporada', e);
      return Failure(Exception(e));
    }
  }

  AsyncResult<Temporada> updateTemporada(Temporada temporada) async {
    try {
      final response = await _httpService.put(
        '/temporadas/${temporada.idTemporada}',
        temporada.toJson(),
      );
      return response.fold((responseBody) {
        final data = jsonDecode(responseBody) as Map<String, dynamic>;
        return Success(Temporada.fromJson(data));
      }, Failure.new);
    } catch (e) {
      _log.severe('Erro ao atualizar temporada', e);
      return Failure(Exception(e));
    }
  }

  AsyncResult<Unit> deleteTemporada(int idTemporada) async {
    try {
      final response = await _httpService.delete('/temporadas/$idTemporada');
      return response.fold((responseBody) {
        return const Success(unit);
      }, Failure.new);
    } catch (e) {
      _log.severe('Erro ao deletar temporada', e);
      return Failure(Exception(e));
    }
  }
}
