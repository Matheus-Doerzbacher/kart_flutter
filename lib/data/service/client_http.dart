// ignore_for_file: avoid_setters_without_getters

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:result_dart/result_dart.dart';

typedef BodyResponse = String;

class ClientHttp {
  final String _baseUrl = 'http://127.0.0.1:8000/api/v1';

  String? _bearerToken;

  set bearerToken(String? token) {
    _bearerToken = token;
  }

  final _log = Logger('ClientHttp');

  void Function()? onUnauthorized;

  String _composeUrl(String endpoint) {
    var newEndpoint = endpoint;
    newEndpoint = endpoint.startsWith('/') ? endpoint : '/$endpoint';
    return '$_baseUrl$newEndpoint';
  }

  Map<String, String> get headers {
    final headers = <String, String>{
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    if (_bearerToken != null) {
      headers[HttpHeaders.authorizationHeader] = 'Bearer $_bearerToken';
    }

    return headers;
  }

  void _checkUnauthorized(int statusCode) {
    if (statusCode == 401) {
      _bearerToken = null;
      onUnauthorized?.call();
    }
  }

  AsyncResult<BodyResponse> get(
    String endpoint, {
    Map<String, String?>? queryParameters,
  }) async {
    try {
      final url = Uri.parse(
        _composeUrl(endpoint),
      ).replace(queryParameters: queryParameters);
      final response = await http.get(url, headers: headers);

      _checkUnauthorized(response.statusCode);

      if (response.statusCode == 200) {
        final responseData = utf8.decode(response.bodyBytes);
        return Success(responseData);
      } else if (response.statusCode == 401) {
        return Failure(Exception('Token inválido, Faça login novamente'));
      } else {
        final body = utf8.decode(response.bodyBytes);
        final msg = jsonDecode(body)['detail'];
        _log.warning('$msg');
        return Failure(Exception('Erro na solicitação http GET'));
      }
    } catch (e) {
      _log.severe('Erro ao buscar dados: $e');
      return Failure(Exception(e));
    }
  }

  AsyncResult<BodyResponse> post(String endpoint, dynamic data) async {
    try {
      final url = Uri.parse(_composeUrl(endpoint));
      final response = await http.post(
        url,
        headers: headers,
        body: utf8.encode(jsonEncode(data)),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = utf8.decode(response.bodyBytes);
        return Success(responseData);
      } else {
        return Failure(
          Exception('Erro na solicitação http POST: ${response.body}'),
        );
      }
    } on Exception catch (e) {
      _log.severe('Erro ao salvar dados: $e');
      return Failure(e);
    }
  }

  AsyncResult<BodyResponse> put(String endpoint, dynamic data) async {
    try {
      final url = Uri.parse(_composeUrl(endpoint));
      final response = await http.put(
        url,
        headers: headers,
        body: utf8.encode(jsonEncode(data)),
      );
      if (response.statusCode == 200) {
        final responseData = utf8.decode(response.bodyBytes);
        return Success(responseData);
      } else {
        final msg =
            response.reasonPhrase == 'Not Found'
                ? 'Rota não encontrada'
                : response.reasonPhrase;
        return Failure(Exception('Erro na solicitação http PUT, Erro: $msg'));
      }
    } on Exception catch (e) {
      _log.severe('Erro ao editar dados: $e');
      return Failure(e);
    }
  }

  AsyncResult<http.Response> delete(String endpoint) async {
    try {
      final url = Uri.parse(_composeUrl(endpoint));
      final response = await http.delete(url, headers: headers);
      if (response.statusCode == 204) {
        return Success(response);
      } else {
        _log.warning('Erro na solicitação http DELETE: ${response.body}');
        return Failure(Exception('Erro na solicitação http DELETE'));
      }
    } on Exception catch (e) {
      _log.severe('Erro ao deletar dados: $e');
      return Failure(e);
    }
  }

  AsyncResult<http.Response> patch(String endpoint, dynamic data) async {
    try {
      final url = Uri.parse(_composeUrl(endpoint));
      final response = await http.patch(
        url,
        headers: headers,
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        return Success(response);
      } else {
        return Failure(Exception('Erro na solicitação http PATCH'));
      }
    } on Exception catch (e) {
      _log.severe('Erro ao editar dados: $e');
      return Failure(e);
    }
  }
}
