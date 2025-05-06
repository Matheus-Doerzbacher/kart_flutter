import 'package:flutter/material.dart';
import 'package:kart_flutter/data/repository/temporada_repository.dart';
import 'package:kart_flutter/domain/models/temporada/temporada.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class ModalTemporadaViewModel extends ChangeNotifier {
  final TemporadaRepository _temporadaRepository;

  ModalTemporadaViewModel({required TemporadaRepository temporadaRepository})
    : _temporadaRepository = temporadaRepository;

  late final upsertTemporada = Command1(_upsertTemporada);

  AsyncResult<Unit> _upsertTemporada(Temporada temporada) async {
    if (temporada.idTemporada == null) {
      final result = await _temporadaRepository.insertTemporada(temporada);
      if (result.isError()) {
        return Failure(Exception('Erro ao inserir temporada'));
      }
      return const Success(unit);
    } else {
      final result = await _temporadaRepository.updateTemporada(temporada);
      if (result.isError()) {
        return Failure(Exception('Erro ao atualizar temporada'));
      }
      return const Success(unit);
    }
  }

  AsyncResult<Unit> deleteTemporada(int idTemporada) {
    return _temporadaRepository.deleteTemporada(idTemporada);
  }
}
