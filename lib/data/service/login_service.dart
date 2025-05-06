import 'dart:convert';

import 'package:kart_flutter/data/service/core/http_service.dart';
import 'package:kart_flutter/data/service/core/local_storage.dart';
import 'package:result_dart/result_dart.dart';

const _tokenKey = '_tokenKey';

class LoginService {
  final HttpService _httpService;
  final LocalStorage _localStorage;

  LoginService({
    required HttpService httpService,
    required LocalStorage localStorage,
  }) : _httpService = httpService,
       _localStorage = localStorage;

  AsyncResult<String> login(String username, String password) async {
    final result = await _httpService.postFormUrlEncoded('/usuarios/login', {
      'grant_type': 'password',
      'username': username,
      'password': password,
      'scope': '', // Empty as shown in the documentation
      'client_id': '', // Replace with your client ID if required
      'client_secret': '', // Replace with your client secret if required
    });

    return result.fold((responseBody) {
      final data = jsonDecode(responseBody);
      final token = data['access_token'] as String;
      return Success(token);
    }, Failure.new);
  }

  AsyncResult<String> getToken() {
    return _localStorage.getData(_tokenKey).map((json) => json);
  }

  AsyncResult<Unit> saveToken(String token) {
    return _localStorage.saveData(_tokenKey, token).pure(unit);
  }

  AsyncResult<Unit> removeToken() {
    return _localStorage.removeData(_tokenKey);
  }
}
