import 'package:flutter/cupertino.dart';
import 'package:kart_flutter/data/repository/temporada_repository.dart';
import 'package:kart_flutter/domain/models/temporada/temporada.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class HomeViewModel extends ChangeNotifier {
  final TemporadaRepository _temporadaRepository;

  HomeViewModel({required TemporadaRepository temporadaRepository})
    : _temporadaRepository = temporadaRepository;

  Temporada? _temporadaAtual;
  Temporada? get temporadaAtual => _temporadaAtual;

  // COMMANDS
  late final getTemporadaAtual = Command0(_getTemporadaAtual);

  AsyncResult<Unit> _getTemporadaAtual() async {
    final result = await _temporadaRepository.getTemporadaAtual();
    return result.fold(
      (temporada) {
        _temporadaAtual = temporada;
        notifyListeners();
        return const Success(unit);
      },
      (error) {
        print(error);
        return Failure(error);
      },
    );
  }
}
