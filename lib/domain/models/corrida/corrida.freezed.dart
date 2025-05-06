// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'corrida.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Corrida {

 DateTime get data;@JsonKey(name: 'id_pista') int get idPista;@JsonKey(name: 'id_temporada') int get idTemporada;@JsonKey(name: 'id_corrida') int? get idCorrida; Pista? get pista;
/// Create a copy of Corrida
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CorridaCopyWith<Corrida> get copyWith => _$CorridaCopyWithImpl<Corrida>(this as Corrida, _$identity);

  /// Serializes this Corrida to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Corrida&&(identical(other.data, data) || other.data == data)&&(identical(other.idPista, idPista) || other.idPista == idPista)&&(identical(other.idTemporada, idTemporada) || other.idTemporada == idTemporada)&&(identical(other.idCorrida, idCorrida) || other.idCorrida == idCorrida)&&(identical(other.pista, pista) || other.pista == pista));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data,idPista,idTemporada,idCorrida,pista);

@override
String toString() {
  return 'Corrida(data: $data, idPista: $idPista, idTemporada: $idTemporada, idCorrida: $idCorrida, pista: $pista)';
}


}

/// @nodoc
abstract mixin class $CorridaCopyWith<$Res>  {
  factory $CorridaCopyWith(Corrida value, $Res Function(Corrida) _then) = _$CorridaCopyWithImpl;
@useResult
$Res call({
 DateTime data,@JsonKey(name: 'id_pista') int idPista,@JsonKey(name: 'id_temporada') int idTemporada,@JsonKey(name: 'id_corrida') int? idCorrida, Pista? pista
});


$PistaCopyWith<$Res>? get pista;

}
/// @nodoc
class _$CorridaCopyWithImpl<$Res>
    implements $CorridaCopyWith<$Res> {
  _$CorridaCopyWithImpl(this._self, this._then);

  final Corrida _self;
  final $Res Function(Corrida) _then;

/// Create a copy of Corrida
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? idPista = null,Object? idTemporada = null,Object? idCorrida = freezed,Object? pista = freezed,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DateTime,idPista: null == idPista ? _self.idPista : idPista // ignore: cast_nullable_to_non_nullable
as int,idTemporada: null == idTemporada ? _self.idTemporada : idTemporada // ignore: cast_nullable_to_non_nullable
as int,idCorrida: freezed == idCorrida ? _self.idCorrida : idCorrida // ignore: cast_nullable_to_non_nullable
as int?,pista: freezed == pista ? _self.pista : pista // ignore: cast_nullable_to_non_nullable
as Pista?,
  ));
}
/// Create a copy of Corrida
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PistaCopyWith<$Res>? get pista {
    if (_self.pista == null) {
    return null;
  }

  return $PistaCopyWith<$Res>(_self.pista!, (value) {
    return _then(_self.copyWith(pista: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Corrida implements Corrida {
   _Corrida({required this.data, @JsonKey(name: 'id_pista') required this.idPista, @JsonKey(name: 'id_temporada') required this.idTemporada, @JsonKey(name: 'id_corrida') this.idCorrida, this.pista});
  factory _Corrida.fromJson(Map<String, dynamic> json) => _$CorridaFromJson(json);

@override final  DateTime data;
@override@JsonKey(name: 'id_pista') final  int idPista;
@override@JsonKey(name: 'id_temporada') final  int idTemporada;
@override@JsonKey(name: 'id_corrida') final  int? idCorrida;
@override final  Pista? pista;

/// Create a copy of Corrida
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CorridaCopyWith<_Corrida> get copyWith => __$CorridaCopyWithImpl<_Corrida>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CorridaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Corrida&&(identical(other.data, data) || other.data == data)&&(identical(other.idPista, idPista) || other.idPista == idPista)&&(identical(other.idTemporada, idTemporada) || other.idTemporada == idTemporada)&&(identical(other.idCorrida, idCorrida) || other.idCorrida == idCorrida)&&(identical(other.pista, pista) || other.pista == pista));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data,idPista,idTemporada,idCorrida,pista);

@override
String toString() {
  return 'Corrida(data: $data, idPista: $idPista, idTemporada: $idTemporada, idCorrida: $idCorrida, pista: $pista)';
}


}

/// @nodoc
abstract mixin class _$CorridaCopyWith<$Res> implements $CorridaCopyWith<$Res> {
  factory _$CorridaCopyWith(_Corrida value, $Res Function(_Corrida) _then) = __$CorridaCopyWithImpl;
@override @useResult
$Res call({
 DateTime data,@JsonKey(name: 'id_pista') int idPista,@JsonKey(name: 'id_temporada') int idTemporada,@JsonKey(name: 'id_corrida') int? idCorrida, Pista? pista
});


@override $PistaCopyWith<$Res>? get pista;

}
/// @nodoc
class __$CorridaCopyWithImpl<$Res>
    implements _$CorridaCopyWith<$Res> {
  __$CorridaCopyWithImpl(this._self, this._then);

  final _Corrida _self;
  final $Res Function(_Corrida) _then;

/// Create a copy of Corrida
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? idPista = null,Object? idTemporada = null,Object? idCorrida = freezed,Object? pista = freezed,}) {
  return _then(_Corrida(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DateTime,idPista: null == idPista ? _self.idPista : idPista // ignore: cast_nullable_to_non_nullable
as int,idTemporada: null == idTemporada ? _self.idTemporada : idTemporada // ignore: cast_nullable_to_non_nullable
as int,idCorrida: freezed == idCorrida ? _self.idCorrida : idCorrida // ignore: cast_nullable_to_non_nullable
as int?,pista: freezed == pista ? _self.pista : pista // ignore: cast_nullable_to_non_nullable
as Pista?,
  ));
}

/// Create a copy of Corrida
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PistaCopyWith<$Res>? get pista {
    if (_self.pista == null) {
    return null;
  }

  return $PistaCopyWith<$Res>(_self.pista!, (value) {
    return _then(_self.copyWith(pista: value));
  });
}
}

// dart format on
