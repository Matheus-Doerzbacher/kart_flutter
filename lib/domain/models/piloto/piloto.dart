import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kart_flutter/domain/models/temporada_piloto/temporada_piloto.dart';

part 'piloto.freezed.dart';
part 'piloto.g.dart';

@freezed
sealed class Piloto with _$Piloto {
  factory Piloto({
    @JsonKey(name: 'id_piloto') int? idPiloto,
    required String nome,
    @JsonKey(name: 'url_foto') required String urlFoto,
    @JsonKey(name: 'temporada_atual') TemporadaPiloto? temporadaAtual,
  }) = _Piloto;

  factory Piloto.fromJson(Map<String, dynamic> json) => _$PilotoFromJson(json);
}
