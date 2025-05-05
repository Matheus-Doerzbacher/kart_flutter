import 'package:flutter/material.dart';
import 'package:kart_flutter/data/repository/temporada_repository.dart';
import 'package:kart_flutter/domain/models/temporada/temporada.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class TemporadasViewmodel extends ChangeNotifier {
  final TemporadaRepository _temporadaRepository;

  TemporadasViewmodel({required TemporadaRepository temporadaRepository})
    : _temporadaRepository = temporadaRepository;

  final List<Temporada> _temporadas = [];
  List<Temporada> get temporadas => _temporadas;

  Temporada? _temporadaSelecionada;
  Temporada? get temporadaSelecionada => _temporadaSelecionada;
  set temporadaSelecionada(Temporada? value) {
    _temporadaSelecionada = value;
    notifyListeners();
  }

  late final fetchTemporadas = Command1(_fetchTemporadas);

  AsyncResult<Unit> _fetchTemporadas(int idTemporada) async {
    final result = await _temporadaRepository.getTemporadas().getOrThrow();

    _temporadas
      ..clear()
      ..addAll(result)
      ..sort((a, b) => b.ano.compareTo(a.ano));
    _temporadaSelecionada = _temporadas.firstWhere(
      (t) => t.idTemporada == idTemporada,
    );

    notifyListeners();
    return const Success(unit);
  }
}
