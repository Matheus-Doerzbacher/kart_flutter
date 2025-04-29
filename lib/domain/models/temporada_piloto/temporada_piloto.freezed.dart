// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'temporada_piloto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TemporadaPiloto {

@JsonKey(name: 'id_piloto') int get idPiloto;@JsonKey(name: 'id_temporada') int get idTemporada;@JsonKey(name: 'id_temporada_piloto') int get idTemporadaPiloto; int? get pontos; int? get vitorias; int? get posicao;
/// Create a copy of TemporadaPiloto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TemporadaPilotoCopyWith<TemporadaPiloto> get copyWith => _$TemporadaPilotoCopyWithImpl<TemporadaPiloto>(this as TemporadaPiloto, _$identity);

  /// Serializes this TemporadaPiloto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TemporadaPiloto&&(identical(other.idPiloto, idPiloto) || other.idPiloto == idPiloto)&&(identical(other.idTemporada, idTemporada) || other.idTemporada == idTemporada)&&(identical(other.idTemporadaPiloto, idTemporadaPiloto) || other.idTemporadaPiloto == idTemporadaPiloto)&&(identical(other.pontos, pontos) || other.pontos == pontos)&&(identical(other.vitorias, vitorias) || other.vitorias == vitorias)&&(identical(other.posicao, posicao) || other.posicao == posicao));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idPiloto,idTemporada,idTemporadaPiloto,pontos,vitorias,posicao);

@override
String toString() {
  return 'TemporadaPiloto(idPiloto: $idPiloto, idTemporada: $idTemporada, idTemporadaPiloto: $idTemporadaPiloto, pontos: $pontos, vitorias: $vitorias, posicao: $posicao)';
}


}

/// @nodoc
abstract mixin class $TemporadaPilotoCopyWith<$Res>  {
  factory $TemporadaPilotoCopyWith(TemporadaPiloto value, $Res Function(TemporadaPiloto) _then) = _$TemporadaPilotoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id_piloto') int idPiloto,@JsonKey(name: 'id_temporada') int idTemporada,@JsonKey(name: 'id_temporada_piloto') int idTemporadaPiloto, int? pontos, int? vitorias, int? posicao
});




}
/// @nodoc
class _$TemporadaPilotoCopyWithImpl<$Res>
    implements $TemporadaPilotoCopyWith<$Res> {
  _$TemporadaPilotoCopyWithImpl(this._self, this._then);

  final TemporadaPiloto _self;
  final $Res Function(TemporadaPiloto) _then;

/// Create a copy of TemporadaPiloto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? idPiloto = null,Object? idTemporada = null,Object? idTemporadaPiloto = null,Object? pontos = freezed,Object? vitorias = freezed,Object? posicao = freezed,}) {
  return _then(_self.copyWith(
idPiloto: null == idPiloto ? _self.idPiloto : idPiloto // ignore: cast_nullable_to_non_nullable
as int,idTemporada: null == idTemporada ? _self.idTemporada : idTemporada // ignore: cast_nullable_to_non_nullable
as int,idTemporadaPiloto: null == idTemporadaPiloto ? _self.idTemporadaPiloto : idTemporadaPiloto // ignore: cast_nullable_to_non_nullable
as int,pontos: freezed == pontos ? _self.pontos : pontos // ignore: cast_nullable_to_non_nullable
as int?,vitorias: freezed == vitorias ? _self.vitorias : vitorias // ignore: cast_nullable_to_non_nullable
as int?,posicao: freezed == posicao ? _self.posicao : posicao // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TemporadaPiloto implements TemporadaPiloto {
  const _TemporadaPiloto({@JsonKey(name: 'id_piloto') required this.idPiloto, @JsonKey(name: 'id_temporada') required this.idTemporada, @JsonKey(name: 'id_temporada_piloto') required this.idTemporadaPiloto, this.pontos, this.vitorias, this.posicao});
  factory _TemporadaPiloto.fromJson(Map<String, dynamic> json) => _$TemporadaPilotoFromJson(json);

@override@JsonKey(name: 'id_piloto') final  int idPiloto;
@override@JsonKey(name: 'id_temporada') final  int idTemporada;
@override@JsonKey(name: 'id_temporada_piloto') final  int idTemporadaPiloto;
@override final  int? pontos;
@override final  int? vitorias;
@override final  int? posicao;

/// Create a copy of TemporadaPiloto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TemporadaPilotoCopyWith<_TemporadaPiloto> get copyWith => __$TemporadaPilotoCopyWithImpl<_TemporadaPiloto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TemporadaPilotoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TemporadaPiloto&&(identical(other.idPiloto, idPiloto) || other.idPiloto == idPiloto)&&(identical(other.idTemporada, idTemporada) || other.idTemporada == idTemporada)&&(identical(other.idTemporadaPiloto, idTemporadaPiloto) || other.idTemporadaPiloto == idTemporadaPiloto)&&(identical(other.pontos, pontos) || other.pontos == pontos)&&(identical(other.vitorias, vitorias) || other.vitorias == vitorias)&&(identical(other.posicao, posicao) || other.posicao == posicao));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idPiloto,idTemporada,idTemporadaPiloto,pontos,vitorias,posicao);

@override
String toString() {
  return 'TemporadaPiloto(idPiloto: $idPiloto, idTemporada: $idTemporada, idTemporadaPiloto: $idTemporadaPiloto, pontos: $pontos, vitorias: $vitorias, posicao: $posicao)';
}


}

/// @nodoc
abstract mixin class _$TemporadaPilotoCopyWith<$Res> implements $TemporadaPilotoCopyWith<$Res> {
  factory _$TemporadaPilotoCopyWith(_TemporadaPiloto value, $Res Function(_TemporadaPiloto) _then) = __$TemporadaPilotoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id_piloto') int idPiloto,@JsonKey(name: 'id_temporada') int idTemporada,@JsonKey(name: 'id_temporada_piloto') int idTemporadaPiloto, int? pontos, int? vitorias, int? posicao
});




}
/// @nodoc
class __$TemporadaPilotoCopyWithImpl<$Res>
    implements _$TemporadaPilotoCopyWith<$Res> {
  __$TemporadaPilotoCopyWithImpl(this._self, this._then);

  final _TemporadaPiloto _self;
  final $Res Function(_TemporadaPiloto) _then;

/// Create a copy of TemporadaPiloto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? idPiloto = null,Object? idTemporada = null,Object? idTemporadaPiloto = null,Object? pontos = freezed,Object? vitorias = freezed,Object? posicao = freezed,}) {
  return _then(_TemporadaPiloto(
idPiloto: null == idPiloto ? _self.idPiloto : idPiloto // ignore: cast_nullable_to_non_nullable
as int,idTemporada: null == idTemporada ? _self.idTemporada : idTemporada // ignore: cast_nullable_to_non_nullable
as int,idTemporadaPiloto: null == idTemporadaPiloto ? _self.idTemporadaPiloto : idTemporadaPiloto // ignore: cast_nullable_to_non_nullable
as int,pontos: freezed == pontos ? _self.pontos : pontos // ignore: cast_nullable_to_non_nullable
as int?,vitorias: freezed == vitorias ? _self.vitorias : vitorias // ignore: cast_nullable_to_non_nullable
as int?,posicao: freezed == posicao ? _self.posicao : posicao // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
