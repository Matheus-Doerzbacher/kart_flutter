import 'package:freezed_annotation/freezed_annotation.dart';

part 'temporada_piloto.freezed.dart';
part 'temporada_piloto.g.dart';

@freezed
sealed class TemporadaPiloto with _$TemporadaPiloto {
  const factory TemporadaPiloto({
    @JsonKey(name: 'id_piloto') required int idPiloto,
    @JsonKey(name: 'id_temporada') required int idTemporada,
    @JsonKey(name: 'id_temporada_piloto') required int idTemporadaPiloto,
    int? pontos,
    int? vitorias,
    int? posicao,
  }) = _TemporadaPiloto;

  factory TemporadaPiloto.fromJson(Map<String, dynamic> json) =>
      _$TemporadaPilotoFromJson(json);
}
