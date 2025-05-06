// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'corrida.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Corrida _$CorridaFromJson(Map<String, dynamic> json) => _Corrida(
  data: DateTime.parse(json['data'] as String),
  idPista: (json['id_pista'] as num).toInt(),
  idTemporada: (json['id_temporada'] as num).toInt(),
  idCorrida: (json['id_corrida'] as num?)?.toInt(),
  pista:
      json['pista'] == null
          ? null
          : Pista.fromJson(json['pista'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CorridaToJson(_Corrida instance) => <String, dynamic>{
  'data': instance.data.toIso8601String(),
  'id_pista': instance.idPista,
  'id_temporada': instance.idTemporada,
  'id_corrida': instance.idCorrida,
  'pista': instance.pista,
};
