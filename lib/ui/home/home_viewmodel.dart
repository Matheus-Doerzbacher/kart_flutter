import 'package:flutter/cupertino.dart';
import 'package:kart_flutter/data/repository/temporada_repository.dart';
import 'package:kart_flutter/domain/models/temporada/temporada.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class HomeViewModel extends ChangeNotifier {
  final TemporadaRepository _temporadaRepository;

  HomeViewModel({required TemporadaRepository temporadaRepository})
    : _temporadaRepository = temporadaRepository;

  final _temporadas = <Temporada>[];
  List<Temporada> get temporadas => _temporadas;

  // COMMANDS
  late final getTemporadas = Command0(_getTemporadas);

  AsyncResult<Unit> _getTemporadas() async {
    final result = await _temporadaRepository.getTemporadas();
    return result.fold(
      (temporadas) {
        _temporadas
          ..clear()
          ..addAll(temporadas);
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
