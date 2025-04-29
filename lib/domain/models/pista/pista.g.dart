// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pista.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Pista _$PistaFromJson(Map<String, dynamic> json) => _Pista(
  idPista: (json['id_pista'] as num?)?.toInt(),
  nome: json['nome'] as String,
  urlImage: json['url_image'] as String,
  local: json['local'] as String,
);

Map<String, dynamic> _$PistaToJson(_Pista instance) => <String, dynamic>{
  'id_pista': instance.idPista,
  'nome': instance.nome,
  'url_image': instance.urlImage,
  'local': instance.local,
};
