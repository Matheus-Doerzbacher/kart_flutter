import 'package:flutter/material.dart';
import 'package:kart_flutter/data/repository/login_repository.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginRepository _loginRepository;

  LoginViewModel({required LoginRepository loginRepository})
    : _loginRepository = loginRepository;

  late final login = Command2(_login);

  AsyncResult<Unit> _login(String username, String password) async {
    return _loginRepository.login(username: username, password: password);
  }
}
