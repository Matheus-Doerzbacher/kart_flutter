String getExceptionText(Exception exception) {
  final exceptionStr = exception.toString();

  if (exceptionStr.contains('The connection errored:')) {
    return 'Erro ao fazer login, verifique sua conexão com a internet';
  } else if (exceptionStr.contains(
    'Client error - the request contains bad syntax or cannot be fulfilled',
  )) {
    return 'Erro ao fazer login, verifique suas credenciais';
  } else {
    return exceptionStr.replaceAll('Exception: ', '');
  }
}
