// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temporada.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Temporada _$TemporadaFromJson(Map<String, dynamic> json) => _Temporada(
  idTemporada: (json['id_temporada'] as num?)?.toInt(),
  descricao: json['descricao'] as String,
  ano: (json['ano'] as num).toInt(),
  isTemporadaAtual: json['is_temporada_atual'] as bool,
);

Map<String, dynamic> _$TemporadaToJson(_Temporada instance) =>
    <String, dynamic>{
      'id_temporada': instance.idTemporada,
      'descricao': instance.descricao,
      'ano': instance.ano,
      'is_temporada_atual': instance.isTemporadaAtual,
    };
