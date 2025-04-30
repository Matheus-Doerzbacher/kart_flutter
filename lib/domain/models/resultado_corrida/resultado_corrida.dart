import 'package:freezed_annotation/freezed_annotation.dart';

part 'resultado_corrida.freezed.dart';
part 'resultado_corrida.g.dart';

@freezed
sealed class ResultadoCorrida with _$ResultadoCorrida {
  factory ResultadoCorrida({
    required int idCorrida,
    required int idPiloto,
    required String tempoQuali,
    required int posicaoQuali,
    required int posicaoChegada,
    required String tempoMelhorVolta,
    required int numeroMelhorVolta,
    required String tempoPilotoFrente,
    required String tempoPilotoLider,
    required int voltas,
    required int numeroKart,
    required double velocidadeMedia,
    required int idResultadoCorrida,
  }) = _ResultadoCorrida;

  factory ResultadoCorrida.fromJson(Map<String, dynamic> json) =>
      _$ResultadoCorridaFromJson(json);
}
