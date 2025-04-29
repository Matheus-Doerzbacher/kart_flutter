// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'piloto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Piloto _$PilotoFromJson(Map<String, dynamic> json) => _Piloto(
  idPiloto: (json['id_piloto'] as num?)?.toInt(),
  nome: json['nome'] as String,
  urlFoto: json['url_foto'] as String,
  temporadaAtual:
      json['temporada_atual'] == null
          ? null
          : TemporadaPiloto.fromJson(
            json['temporada_atual'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$PilotoToJson(_Piloto instance) => <String, dynamic>{
  'id_piloto': instance.idPiloto,
  'nome': instance.nome,
  'url_foto': instance.urlFoto,
  'temporada_atual': instance.temporadaAtual,
};
