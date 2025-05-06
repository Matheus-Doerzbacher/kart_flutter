import 'package:encrypt_shared_preferences/provider.dart';
import 'package:kart_flutter/data/exceptions/exceptions.dart';
import 'package:result_dart/result_dart.dart';

class LocalStorage {
  final _sharedPref = EncryptedSharedPreferences.getInstance();

  AsyncResult<String> saveData(String key, String value) async {
    try {
      await _sharedPref.setString(key, value);
      return Success(value);
    } catch (e, s) {
      return Failure(LocalStorageException(e.toString(), s));
    }
  }

  AsyncResult<String> getData(String key) async {
    try {
      final value = _sharedPref.getString(key);
      return value != null
          ? Success(value)
          : Failure(
            Exception('Erro ao obter os dados do armazenamento local 2'),
          );
    } catch (e, s) {
      return Failure(LocalStorageException(e.toString(), s));
    }
  }

  AsyncResult<Unit> removeData(String key) async {
    try {
      await _sharedPref.remove(key);
      return const Success(unit);
    } catch (e, s) {
      return Failure(LocalStorageException(e.toString(), s));
    }
  }
}
