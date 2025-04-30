// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resultado_corrida.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResultadoCorrida {

 int get idCorrida; int get idPiloto; String get tempoQuali; int get posicaoQuali; int get posicaoChegada; String get tempoMelhorVolta; int get numeroMelhorVolta; String get tempoPilotoFrente; String get tempoPilotoLider; int get voltas; int get numeroKart; double get velocidadeMedia; int get idResultadoCorrida;
/// Create a copy of ResultadoCorrida
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultadoCorridaCopyWith<ResultadoCorrida> get copyWith => _$ResultadoCorridaCopyWithImpl<ResultadoCorrida>(this as ResultadoCorrida, _$identity);

  /// Serializes this ResultadoCorrida to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultadoCorrida&&(identical(other.idCorrida, idCorrida) || other.idCorrida == idCorrida)&&(identical(other.idPiloto, idPiloto) || other.idPiloto == idPiloto)&&(identical(other.tempoQuali, tempoQuali) || other.tempoQuali == tempoQuali)&&(identical(other.posicaoQuali, posicaoQuali) || other.posicaoQuali == posicaoQuali)&&(identical(other.posicaoChegada, posicaoChegada) || other.posicaoChegada == posicaoChegada)&&(identical(other.tempoMelhorVolta, tempoMelhorVolta) || other.tempoMelhorVolta == tempoMelhorVolta)&&(identical(other.numeroMelhorVolta, numeroMelhorVolta) || other.numeroMelhorVolta == numeroMelhorVolta)&&(identical(other.tempoPilotoFrente, tempoPilotoFrente) || other.tempoPilotoFrente == tempoPilotoFrente)&&(identical(other.tempoPilotoLider, tempoPilotoLider) || other.tempoPilotoLider == tempoPilotoLider)&&(identical(other.voltas, voltas) || other.voltas == voltas)&&(identical(other.numeroKart, numeroKart) || other.numeroKart == numeroKart)&&(identical(other.velocidadeMedia, velocidadeMedia) || other.velocidadeMedia == velocidadeMedia)&&(identical(other.idResultadoCorrida, idResultadoCorrida) || other.idResultadoCorrida == idResultadoCorrida));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idCorrida,idPiloto,tempoQuali,posicaoQuali,posicaoChegada,tempoMelhorVolta,numeroMelhorVolta,tempoPilotoFrente,tempoPilotoLider,voltas,numeroKart,velocidadeMedia,idResultadoCorrida);

@override
String toString() {
  return 'ResultadoCorrida(idCorrida: $idCorrida, idPiloto: $idPiloto, tempoQuali: $tempoQuali, posicaoQuali: $posicaoQuali, posicaoChegada: $posicaoChegada, tempoMelhorVolta: $tempoMelhorVolta, numeroMelhorVolta: $numeroMelhorVolta, tempoPilotoFrente: $tempoPilotoFrente, tempoPilotoLider: $tempoPilotoLider, voltas: $voltas, numeroKart: $numeroKart, velocidadeMedia: $velocidadeMedia, idResultadoCorrida: $idResultadoCorrida)';
}


}

/// @nodoc
abstract mixin class $ResultadoCorridaCopyWith<$Res>  {
  factory $ResultadoCorridaCopyWith(ResultadoCorrida value, $Res Function(ResultadoCorrida) _then) = _$ResultadoCorridaCopyWithImpl;
@useResult
$Res call({
 int idCorrida, int idPiloto, String tempoQuali, int posicaoQuali, int posicaoChegada, String tempoMelhorVolta, int numeroMelhorVolta, String tempoPilotoFrente, String tempoPilotoLider, int voltas, int numeroKart, double velocidadeMedia, int idResultadoCorrida
});




}
/// @nodoc
class _$ResultadoCorridaCopyWithImpl<$Res>
    implements $ResultadoCorridaCopyWith<$Res> {
  _$ResultadoCorridaCopyWithImpl(this._self, this._then);

  final ResultadoCorrida _self;
  final $Res Function(ResultadoCorrida) _then;

/// Create a copy of ResultadoCorrida
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? idCorrida = null,Object? idPiloto = null,Object? tempoQuali = null,Object? posicaoQuali = null,Object? posicaoChegada = null,Object? tempoMelhorVolta = null,Object? numeroMelhorVolta = null,Object? tempoPilotoFrente = null,Object? tempoPilotoLider = null,Object? voltas = null,Object? numeroKart = null,Object? velocidadeMedia = null,Object? idResultadoCorrida = null,}) {
  return _then(_self.copyWith(
idCorrida: null == idCorrida ? _self.idCorrida : idCorrida // ignore: cast_nullable_to_non_nullable
as int,idPiloto: null == idPiloto ? _self.idPiloto : idPiloto // ignore: cast_nullable_to_non_nullable
as int,tempoQuali: null == tempoQuali ? _self.tempoQuali : tempoQuali // ignore: cast_nullable_to_non_nullable
as String,posicaoQuali: null == posicaoQuali ? _self.posicaoQuali : posicaoQuali // ignore: cast_nullable_to_non_nullable
as int,posicaoChegada: null == posicaoChegada ? _self.posicaoChegada : posicaoChegada // ignore: cast_nullable_to_non_nullable
as int,tempoMelhorVolta: null == tempoMelhorVolta ? _self.tempoMelhorVolta : tempoMelhorVolta // ignore: cast_nullable_to_non_nullable
as String,numeroMelhorVolta: null == numeroMelhorVolta ? _self.numeroMelhorVolta : numeroMelhorVolta // ignore: cast_nullable_to_non_nullable
as int,tempoPilotoFrente: null == tempoPilotoFrente ? _self.tempoPilotoFrente : tempoPilotoFrente // ignore: cast_nullable_to_non_nullable
as String,tempoPilotoLider: null == tempoPilotoLider ? _self.tempoPilotoLider : tempoPilotoLider // ignore: cast_nullable_to_non_nullable
as String,voltas: null == voltas ? _self.voltas : voltas // ignore: cast_nullable_to_non_nullable
as int,numeroKart: null == numeroKart ? _self.numeroKart : numeroKart // ignore: cast_nullable_to_non_nullable
as int,velocidadeMedia: null == velocidadeMedia ? _self.velocidadeMedia : velocidadeMedia // ignore: cast_nullable_to_non_nullable
as double,idResultadoCorrida: null == idResultadoCorrida ? _self.idResultadoCorrida : idResultadoCorrida // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ResultadoCorrida implements ResultadoCorrida {
   _ResultadoCorrida({required this.idCorrida, required this.idPiloto, required this.tempoQuali, required this.posicaoQuali, required this.posicaoChegada, required this.tempoMelhorVolta, required this.numeroMelhorVolta, required this.tempoPilotoFrente, required this.tempoPilotoLider, required this.voltas, required this.numeroKart, required this.velocidadeMedia, required this.idResultadoCorrida});
  factory _ResultadoCorrida.fromJson(Map<String, dynamic> json) => _$ResultadoCorridaFromJson(json);

@override final  int idCorrida;
@override final  int idPiloto;
@override final  String tempoQuali;
@override final  int posicaoQuali;
@override final  int posicaoChegada;
@override final  String tempoMelhorVolta;
@override final  int numeroMelhorVolta;
@override final  String tempoPilotoFrente;
@override final  String tempoPilotoLider;
@override final  int voltas;
@override final  int numeroKart;
@override final  double velocidadeMedia;
@override final  int idResultadoCorrida;

/// Create a copy of ResultadoCorrida
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResultadoCorridaCopyWith<_ResultadoCorrida> get copyWith => __$ResultadoCorridaCopyWithImpl<_ResultadoCorrida>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResultadoCorridaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResultadoCorrida&&(identical(other.idCorrida, idCorrida) || other.idCorrida == idCorrida)&&(identical(other.idPiloto, idPiloto) || other.idPiloto == idPiloto)&&(identical(other.tempoQuali, tempoQuali) || other.tempoQuali == tempoQuali)&&(identical(other.posicaoQuali, posicaoQuali) || other.posicaoQuali == posicaoQuali)&&(identical(other.posicaoChegada, posicaoChegada) || other.posicaoChegada == posicaoChegada)&&(identical(other.tempoMelhorVolta, tempoMelhorVolta) || other.tempoMelhorVolta == tempoMelhorVolta)&&(identical(other.numeroMelhorVolta, numeroMelhorVolta) || other.numeroMelhorVolta == numeroMelhorVolta)&&(identical(other.tempoPilotoFrente, tempoPilotoFrente) || other.tempoPilotoFrente == tempoPilotoFrente)&&(identical(other.tempoPilotoLider, tempoPilotoLider) || other.tempoPilotoLider == tempoPilotoLider)&&(identical(other.voltas, voltas) || other.voltas == voltas)&&(identical(other.numeroKart, numeroKart) || other.numeroKart == numeroKart)&&(identical(other.velocidadeMedia, velocidadeMedia) || other.velocidadeMedia == velocidadeMedia)&&(identical(other.idResultadoCorrida, idResultadoCorrida) || other.idResultadoCorrida == idResultadoCorrida));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idCorrida,idPiloto,tempoQuali,posicaoQuali,posicaoChegada,tempoMelhorVolta,numeroMelhorVolta,tempoPilotoFrente,tempoPilotoLider,voltas,numeroKart,velocidadeMedia,idResultadoCorrida);

@override
String toString() {
  return 'ResultadoCorrida(idCorrida: $idCorrida, idPiloto: $idPiloto, tempoQuali: $tempoQuali, posicaoQuali: $posicaoQuali, posicaoChegada: $posicaoChegada, tempoMelhorVolta: $tempoMelhorVolta, numeroMelhorVolta: $numeroMelhorVolta, tempoPilotoFrente: $tempoPilotoFrente, tempoPilotoLider: $tempoPilotoLider, voltas: $voltas, numeroKart: $numeroKart, velocidadeMedia: $velocidadeMedia, idResultadoCorrida: $idResultadoCorrida)';
}


}

/// @nodoc
abstract mixin class _$ResultadoCorridaCopyWith<$Res> implements $ResultadoCorridaCopyWith<$Res> {
  factory _$ResultadoCorridaCopyWith(_ResultadoCorrida value, $Res Function(_ResultadoCorrida) _then) = __$ResultadoCorridaCopyWithImpl;
@override @useResult
$Res call({
 int idCorrida, int idPiloto, String tempoQuali, int posicaoQuali, int posicaoChegada, String tempoMelhorVolta, int numeroMelhorVolta, String tempoPilotoFrente, String tempoPilotoLider, int voltas, int numeroKart, double velocidadeMedia, int idResultadoCorrida
});




}
/// @nodoc
class __$ResultadoCorridaCopyWithImpl<$Res>
    implements _$ResultadoCorridaCopyWith<$Res> {
  __$ResultadoCorridaCopyWithImpl(this._self, this._then);

  final _ResultadoCorrida _self;
  final $Res Function(_ResultadoCorrida) _then;

/// Create a copy of ResultadoCorrida
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? idCorrida = null,Object? idPiloto = null,Object? tempoQuali = null,Object? posicaoQuali = null,Object? posicaoChegada = null,Object? tempoMelhorVolta = null,Object? numeroMelhorVolta = null,Object? tempoPilotoFrente = null,Object? tempoPilotoLider = null,Object? voltas = null,Object? numeroKart = null,Object? velocidadeMedia = null,Object? idResultadoCorrida = null,}) {
  return _then(_ResultadoCorrida(
idCorrida: null == idCorrida ? _self.idCorrida : idCorrida // ignore: cast_nullable_to_non_nullable
as int,idPiloto: null == idPiloto ? _self.idPiloto : idPiloto // ignore: cast_nullable_to_non_nullable
as int,tempoQuali: null == tempoQuali ? _self.tempoQuali : tempoQuali // ignore: cast_nullable_to_non_nullable
as String,posicaoQuali: null == posicaoQuali ? _self.posicaoQuali : posicaoQuali // ignore: cast_nullable_to_non_nullable
as int,posicaoChegada: null == posicaoChegada ? _self.posicaoChegada : posicaoChegada // ignore: cast_nullable_to_non_nullable
as int,tempoMelhorVolta: null == tempoMelhorVolta ? _self.tempoMelhorVolta : tempoMelhorVolta // ignore: cast_nullable_to_non_nullable
as String,numeroMelhorVolta: null == numeroMelhorVolta ? _self.numeroMelhorVolta : numeroMelhorVolta // ignore: cast_nullable_to_non_nullable
as int,tempoPilotoFrente: null == tempoPilotoFrente ? _self.tempoPilotoFrente : tempoPilotoFrente // ignore: cast_nullable_to_non_nullable
as String,tempoPilotoLider: null == tempoPilotoLider ? _self.tempoPilotoLider : tempoPilotoLider // ignore: cast_nullable_to_non_nullable
as String,voltas: null == voltas ? _self.voltas : voltas // ignore: cast_nullable_to_non_nullable
as int,numeroKart: null == numeroKart ? _self.numeroKart : numeroKart // ignore: cast_nullable_to_non_nullable
as int,velocidadeMedia: null == velocidadeMedia ? _self.velocidadeMedia : velocidadeMedia // ignore: cast_nullable_to_non_nullable
as double,idResultadoCorrida: null == idResultadoCorrida ? _self.idResultadoCorrida : idResultadoCorrida // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
