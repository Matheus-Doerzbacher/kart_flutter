// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resultado_corrida.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResultadoCorrida _$ResultadoCorridaFromJson(Map<String, dynamic> json) =>
    _ResultadoCorrida(
      idCorrida: (json['idCorrida'] as num).toInt(),
      idPiloto: (json['idPiloto'] as num).toInt(),
      tempoQuali: json['tempoQuali'] as String,
      posicaoQuali: (json['posicaoQuali'] as num).toInt(),
      posicaoChegada: (json['posicaoChegada'] as num).toInt(),
      tempoMelhorVolta: json['tempoMelhorVolta'] as String,
      numeroMelhorVolta: (json['numeroMelhorVolta'] as num).toInt(),
      tempoPilotoFrente: json['tempoPilotoFrente'] as String,
      tempoPilotoLider: json['tempoPilotoLider'] as String,
      voltas: (json['voltas'] as num).toInt(),
      numeroKart: (json['numeroKart'] as num).toInt(),
      velocidadeMedia: (json['velocidadeMedia'] as num).toDouble(),
      idResultadoCorrida: (json['idResultadoCorrida'] as num).toInt(),
    );

Map<String, dynamic> _$ResultadoCorridaToJson(_ResultadoCorrida instance) =>
    <String, dynamic>{
      'idCorrida': instance.idCorrida,
      'idPiloto': instance.idPiloto,
      'tempoQuali': instance.tempoQuali,
      'posicaoQuali': instance.posicaoQuali,
      'posicaoChegada': instance.posicaoChegada,
      'tempoMelhorVolta': instance.tempoMelhorVolta,
      'numeroMelhorVolta': instance.numeroMelhorVolta,
      'tempoPilotoFrente': instance.tempoPilotoFrente,
      'tempoPilotoLider': instance.tempoPilotoLider,
      'voltas': instance.voltas,
      'numeroKart': instance.numeroKart,
      'velocidadeMedia': instance.velocidadeMedia,
      'idResultadoCorrida': instance.idResultadoCorrida,
    };
