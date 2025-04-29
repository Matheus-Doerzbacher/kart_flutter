// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temporada_piloto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TemporadaPiloto _$TemporadaPilotoFromJson(Map<String, dynamic> json) =>
    _TemporadaPiloto(
      idPiloto: (json['id_piloto'] as num).toInt(),
      idTemporada: (json['id_temporada'] as num).toInt(),
      idTemporadaPiloto: (json['id_temporada_piloto'] as num).toInt(),
      pontos: (json['pontos'] as num?)?.toInt(),
      vitorias: (json['vitorias'] as num?)?.toInt(),
      posicao: (json['posicao'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TemporadaPilotoToJson(_TemporadaPiloto instance) =>
    <String, dynamic>{
      'id_piloto': instance.idPiloto,
      'id_temporada': instance.idTemporada,
      'id_temporada_piloto': instance.idTemporadaPiloto,
      'pontos': instance.pontos,
      'vitorias': instance.vitorias,
      'posicao': instance.posicao,
    };
