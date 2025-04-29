// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'temporada.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Temporada {

@JsonKey(name: 'id_temporada') int? get idTemporada; String get descricao; int get ano;@JsonKey(name: 'is_temporada_atual') bool get isTemporadaAtual;
/// Create a copy of Temporada
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TemporadaCopyWith<Temporada> get copyWith => _$TemporadaCopyWithImpl<Temporada>(this as Temporada, _$identity);

  /// Serializes this Temporada to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Temporada&&(identical(other.idTemporada, idTemporada) || other.idTemporada == idTemporada)&&(identical(other.descricao, descricao) || other.descricao == descricao)&&(identical(other.ano, ano) || other.ano == ano)&&(identical(other.isTemporadaAtual, isTemporadaAtual) || other.isTemporadaAtual == isTemporadaAtual));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idTemporada,descricao,ano,isTemporadaAtual);

@override
String toString() {
  return 'Temporada(idTemporada: $idTemporada, descricao: $descricao, ano: $ano, isTemporadaAtual: $isTemporadaAtual)';
}


}

/// @nodoc
abstract mixin class $TemporadaCopyWith<$Res>  {
  factory $TemporadaCopyWith(Temporada value, $Res Function(Temporada) _then) = _$TemporadaCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id_temporada') int? idTemporada, String descricao, int ano,@JsonKey(name: 'is_temporada_atual') bool isTemporadaAtual
});




}
/// @nodoc
class _$TemporadaCopyWithImpl<$Res>
    implements $TemporadaCopyWith<$Res> {
  _$TemporadaCopyWithImpl(this._self, this._then);

  final Temporada _self;
  final $Res Function(Temporada) _then;

/// Create a copy of Temporada
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? idTemporada = freezed,Object? descricao = null,Object? ano = null,Object? isTemporadaAtual = null,}) {
  return _then(_self.copyWith(
idTemporada: freezed == idTemporada ? _self.idTemporada : idTemporada // ignore: cast_nullable_to_non_nullable
as int?,descricao: null == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String,ano: null == ano ? _self.ano : ano // ignore: cast_nullable_to_non_nullable
as int,isTemporadaAtual: null == isTemporadaAtual ? _self.isTemporadaAtual : isTemporadaAtual // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Temporada implements Temporada {
   _Temporada({@JsonKey(name: 'id_temporada') this.idTemporada, required this.descricao, required this.ano, @JsonKey(name: 'is_temporada_atual') required this.isTemporadaAtual});
  factory _Temporada.fromJson(Map<String, dynamic> json) => _$TemporadaFromJson(json);

@override@JsonKey(name: 'id_temporada') final  int? idTemporada;
@override final  String descricao;
@override final  int ano;
@override@JsonKey(name: 'is_temporada_atual') final  bool isTemporadaAtual;

/// Create a copy of Temporada
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TemporadaCopyWith<_Temporada> get copyWith => __$TemporadaCopyWithImpl<_Temporada>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TemporadaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Temporada&&(identical(other.idTemporada, idTemporada) || other.idTemporada == idTemporada)&&(identical(other.descricao, descricao) || other.descricao == descricao)&&(identical(other.ano, ano) || other.ano == ano)&&(identical(other.isTemporadaAtual, isTemporadaAtual) || other.isTemporadaAtual == isTemporadaAtual));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idTemporada,descricao,ano,isTemporadaAtual);

@override
String toString() {
  return 'Temporada(idTemporada: $idTemporada, descricao: $descricao, ano: $ano, isTemporadaAtual: $isTemporadaAtual)';
}


}

/// @nodoc
abstract mixin class _$TemporadaCopyWith<$Res> implements $TemporadaCopyWith<$Res> {
  factory _$TemporadaCopyWith(_Temporada value, $Res Function(_Temporada) _then) = __$TemporadaCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id_temporada') int? idTemporada, String descricao, int ano,@JsonKey(name: 'is_temporada_atual') bool isTemporadaAtual
});




}
/// @nodoc
class __$TemporadaCopyWithImpl<$Res>
    implements _$TemporadaCopyWith<$Res> {
  __$TemporadaCopyWithImpl(this._self, this._then);

  final _Temporada _self;
  final $Res Function(_Temporada) _then;

/// Create a copy of Temporada
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? idTemporada = freezed,Object? descricao = null,Object? ano = null,Object? isTemporadaAtual = null,}) {
  return _then(_Temporada(
idTemporada: freezed == idTemporada ? _self.idTemporada : idTemporada // ignore: cast_nullable_to_non_nullable
as int?,descricao: null == descricao ? _self.descricao : descricao // ignore: cast_nullable_to_non_nullable
as String,ano: null == ano ? _self.ano : ano // ignore: cast_nullable_to_non_nullable
as int,isTemporadaAtual: null == isTemporadaAtual ? _self.isTemporadaAtual : isTemporadaAtual // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
