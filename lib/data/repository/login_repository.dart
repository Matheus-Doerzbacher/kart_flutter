import 'package:flutter/material.dart';
import 'package:kart_flutter/data/service/core/http_service.dart';
import 'package:kart_flutter/data/service/login_service.dart';
import 'package:result_dart/result_dart.dart';

class LoginRepository extends ChangeNotifier {
  final LoginService _loginService;
  final HttpService _httpService;

  LoginRepository({
    required LoginService loginService,
    required HttpService httpService,
  }) : _loginService = loginService,
       _httpService = httpService {
    // Inicializa verificando o estado de autenticação
    _initAuth();
  }

  bool _isAuthenticated = false;

  // Propriedade síncrona para verificar autenticação
  bool get isAuthenticated => _isAuthenticated;

  // Inicializa a autenticação ao criar o repositório
  Future<void> _initAuth() async {
    await _fetch();
  }

  Future<void> _fetch() async {
    try {
      final token = await _loginService.getToken().getOrNull();

      if (token == null) {
        _isAuthenticated = false;
        notifyListeners();
        return;
      }

      _httpService.bearerToken = token;
      _isAuthenticated = true;
      notifyListeners();
    } catch (e) {
      _isAuthenticated = false;
      notifyListeners();
      Exception(e);
    }
  }

  Future<bool> get isAuthenticatedAsync async {
    if (!_isAuthenticated) {
      await _fetch();
    }
    return _isAuthenticated;
  }

  AsyncResult<Unit> login({
    required String username,
    required String password,
  }) async {
    final result = await _loginService.login(username, password);

    return result.fold(
      (token) async {
        await _loginService.saveToken(token);
        await _fetch();
        notifyListeners();
        return const Success(unit);
      },
      (failure) {
        notifyListeners();
        if (failure.toString().contains('The connection errored:')) {
          return Failure(
            Exception(
              'Erro ao fazer login, verifique sua conexão com a internet',
            ),
          );
        }
        return Failure(failure);
      },
    );
  }

  AsyncResult<Unit> logout() async {
    final result = await _loginService.removeToken();

    if (result.isError()) {
      return Failure(Exception('Erro ao deletar o token do localStorage'));
    }
    _isAuthenticated = false;
    notifyListeners();
    return result;
  }
}
