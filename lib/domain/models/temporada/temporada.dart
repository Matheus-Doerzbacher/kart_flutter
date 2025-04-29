import 'package:freezed_annotation/freezed_annotation.dart';

part 'temporada.freezed.dart';
part 'temporada.g.dart';

@freezed
sealed class Temporada with _$Temporada {
  factory Temporada({
    @JsonKey(name: 'id_temporada') int? idTemporada,
    required String descricao,
    required int ano,
    @JsonKey(name: 'is_temporada_atual') required bool isTemporadaAtual,
  }) = _Temporada;

  factory Temporada.fromJson(Map<String, dynamic> json) =>
      _$TemporadaFromJson(json);
}
