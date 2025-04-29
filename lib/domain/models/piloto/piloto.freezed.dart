// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'piloto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Piloto {

@JsonKey(name: 'id_piloto') int? get idPiloto; String get nome;@JsonKey(name: 'url_foto') String get urlFoto;@JsonKey(name: 'temporada_atual') TemporadaPiloto? get temporadaAtual;
/// Create a copy of Piloto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PilotoCopyWith<Piloto> get copyWith => _$PilotoCopyWithImpl<Piloto>(this as Piloto, _$identity);

  /// Serializes this Piloto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Piloto&&(identical(other.idPiloto, idPiloto) || other.idPiloto == idPiloto)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.urlFoto, urlFoto) || other.urlFoto == urlFoto)&&(identical(other.temporadaAtual, temporadaAtual) || other.temporadaAtual == temporadaAtual));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idPiloto,nome,urlFoto,temporadaAtual);

@override
String toString() {
  return 'Piloto(idPiloto: $idPiloto, nome: $nome, urlFoto: $urlFoto, temporadaAtual: $temporadaAtual)';
}


}

/// @nodoc
abstract mixin class $PilotoCopyWith<$Res>  {
  factory $PilotoCopyWith(Piloto value, $Res Function(Piloto) _then) = _$PilotoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id_piloto') int? idPiloto, String nome,@JsonKey(name: 'url_foto') String urlFoto,@JsonKey(name: 'temporada_atual') TemporadaPiloto? temporadaAtual
});


$TemporadaPilotoCopyWith<$Res>? get temporadaAtual;

}
/// @nodoc
class _$PilotoCopyWithImpl<$Res>
    implements $PilotoCopyWith<$Res> {
  _$PilotoCopyWithImpl(this._self, this._then);

  final Piloto _self;
  final $Res Function(Piloto) _then;

/// Create a copy of Piloto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? idPiloto = freezed,Object? nome = null,Object? urlFoto = null,Object? temporadaAtual = freezed,}) {
  return _then(_self.copyWith(
idPiloto: freezed == idPiloto ? _self.idPiloto : idPiloto // ignore: cast_nullable_to_non_nullable
as int?,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,urlFoto: null == urlFoto ? _self.urlFoto : urlFoto // ignore: cast_nullable_to_non_nullable
as String,temporadaAtual: freezed == temporadaAtual ? _self.temporadaAtual : temporadaAtual // ignore: cast_nullable_to_non_nullable
as TemporadaPiloto?,
  ));
}
/// Create a copy of Piloto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TemporadaPilotoCopyWith<$Res>? get temporadaAtual {
    if (_self.temporadaAtual == null) {
    return null;
  }

  return $TemporadaPilotoCopyWith<$Res>(_self.temporadaAtual!, (value) {
    return _then(_self.copyWith(temporadaAtual: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Piloto implements Piloto {
   _Piloto({@JsonKey(name: 'id_piloto') this.idPiloto, required this.nome, @JsonKey(name: 'url_foto') required this.urlFoto, @JsonKey(name: 'temporada_atual') this.temporadaAtual});
  factory _Piloto.fromJson(Map<String, dynamic> json) => _$PilotoFromJson(json);

@override@JsonKey(name: 'id_piloto') final  int? idPiloto;
@override final  String nome;
@override@JsonKey(name: 'url_foto') final  String urlFoto;
@override@JsonKey(name: 'temporada_atual') final  TemporadaPiloto? temporadaAtual;

/// Create a copy of Piloto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PilotoCopyWith<_Piloto> get copyWith => __$PilotoCopyWithImpl<_Piloto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PilotoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Piloto&&(identical(other.idPiloto, idPiloto) || other.idPiloto == idPiloto)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.urlFoto, urlFoto) || other.urlFoto == urlFoto)&&(identical(other.temporadaAtual, temporadaAtual) || other.temporadaAtual == temporadaAtual));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idPiloto,nome,urlFoto,temporadaAtual);

@override
String toString() {
  return 'Piloto(idPiloto: $idPiloto, nome: $nome, urlFoto: $urlFoto, temporadaAtual: $temporadaAtual)';
}


}

/// @nodoc
abstract mixin class _$PilotoCopyWith<$Res> implements $PilotoCopyWith<$Res> {
  factory _$PilotoCopyWith(_Piloto value, $Res Function(_Piloto) _then) = __$PilotoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id_piloto') int? idPiloto, String nome,@JsonKey(name: 'url_foto') String urlFoto,@JsonKey(name: 'temporada_atual') TemporadaPiloto? temporadaAtual
});


@override $TemporadaPilotoCopyWith<$Res>? get temporadaAtual;

}
/// @nodoc
class __$PilotoCopyWithImpl<$Res>
    implements _$PilotoCopyWith<$Res> {
  __$PilotoCopyWithImpl(this._self, this._then);

  final _Piloto _self;
  final $Res Function(_Piloto) _then;

/// Create a copy of Piloto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? idPiloto = freezed,Object? nome = null,Object? urlFoto = null,Object? temporadaAtual = freezed,}) {
  return _then(_Piloto(
idPiloto: freezed == idPiloto ? _self.idPiloto : idPiloto // ignore: cast_nullable_to_non_nullable
as int?,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,urlFoto: null == urlFoto ? _self.urlFoto : urlFoto // ignore: cast_nullable_to_non_nullable
as String,temporadaAtual: freezed == temporadaAtual ? _self.temporadaAtual : temporadaAtual // ignore: cast_nullable_to_non_nullable
as TemporadaPiloto?,
  ));
}

/// Create a copy of Piloto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TemporadaPilotoCopyWith<$Res>? get temporadaAtual {
    if (_self.temporadaAtual == null) {
    return null;
  }

  return $TemporadaPilotoCopyWith<$Res>(_self.temporadaAtual!, (value) {
    return _then(_self.copyWith(temporadaAtual: value));
  });
}
}

// dart format on
