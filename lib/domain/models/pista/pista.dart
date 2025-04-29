import 'package:freezed_annotation/freezed_annotation.dart';

part 'pista.freezed.dart';
part 'pista.g.dart';

@freezed
sealed class Pista with _$Pista {
  factory Pista({
    @JsonKey(name: 'id_pista') int? idPista,
    required String nome,
    @JsonKey(name: 'url_image') required String urlImage,
    required String local,
  }) = _Pista;

  factory Pista.fromJson(Map<String, dynamic> json) => _$PistaFromJson(json);
}
