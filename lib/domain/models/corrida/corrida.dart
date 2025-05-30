import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kart_flutter/domain/models/pista/pista.dart';

part 'corrida.freezed.dart';
part 'corrida.g.dart';

@freezed
sealed class Corrida with _$Corrida {
  factory Corrida({
    required DateTime data,
    @JsonKey(name: 'id_pista') required int idPista,
    @JsonKey(name: 'id_temporada') required int idTemporada,
    @JsonKey(name: 'id_corrida') int? idCorrida,
    Pista? pista,
  }) = _Corrida;

  factory Corrida.fromJson(Map<String, dynamic> json) =>
      _$CorridaFromJson(json);
}
