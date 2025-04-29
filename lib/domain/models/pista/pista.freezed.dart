// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pista.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Pista {

@JsonKey(name: 'id_pista') int? get idPista; String get nome;@JsonKey(name: 'url_image') String get urlImage; String get local;
/// Create a copy of Pista
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PistaCopyWith<Pista> get copyWith => _$PistaCopyWithImpl<Pista>(this as Pista, _$identity);

  /// Serializes this Pista to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Pista&&(identical(other.idPista, idPista) || other.idPista == idPista)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.urlImage, urlImage) || other.urlImage == urlImage)&&(identical(other.local, local) || other.local == local));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idPista,nome,urlImage,local);

@override
String toString() {
  return 'Pista(idPista: $idPista, nome: $nome, urlImage: $urlImage, local: $local)';
}


}

/// @nodoc
abstract mixin class $PistaCopyWith<$Res>  {
  factory $PistaCopyWith(Pista value, $Res Function(Pista) _then) = _$PistaCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id_pista') int? idPista, String nome,@JsonKey(name: 'url_image') String urlImage, String local
});




}
/// @nodoc
class _$PistaCopyWithImpl<$Res>
    implements $PistaCopyWith<$Res> {
  _$PistaCopyWithImpl(this._self, this._then);

  final Pista _self;
  final $Res Function(Pista) _then;

/// Create a copy of Pista
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? idPista = freezed,Object? nome = null,Object? urlImage = null,Object? local = null,}) {
  return _then(_self.copyWith(
idPista: freezed == idPista ? _self.idPista : idPista // ignore: cast_nullable_to_non_nullable
as int?,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,urlImage: null == urlImage ? _self.urlImage : urlImage // ignore: cast_nullable_to_non_nullable
as String,local: null == local ? _self.local : local // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Pista implements Pista {
   _Pista({@JsonKey(name: 'id_pista') this.idPista, required this.nome, @JsonKey(name: 'url_image') required this.urlImage, required this.local});
  factory _Pista.fromJson(Map<String, dynamic> json) => _$PistaFromJson(json);

@override@JsonKey(name: 'id_pista') final  int? idPista;
@override final  String nome;
@override@JsonKey(name: 'url_image') final  String urlImage;
@override final  String local;

/// Create a copy of Pista
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PistaCopyWith<_Pista> get copyWith => __$PistaCopyWithImpl<_Pista>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PistaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Pista&&(identical(other.idPista, idPista) || other.idPista == idPista)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.urlImage, urlImage) || other.urlImage == urlImage)&&(identical(other.local, local) || other.local == local));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idPista,nome,urlImage,local);

@override
String toString() {
  return 'Pista(idPista: $idPista, nome: $nome, urlImage: $urlImage, local: $local)';
}


}

/// @nodoc
abstract mixin class _$PistaCopyWith<$Res> implements $PistaCopyWith<$Res> {
  factory _$PistaCopyWith(_Pista value, $Res Function(_Pista) _then) = __$PistaCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id_pista') int? idPista, String nome,@JsonKey(name: 'url_image') String urlImage, String local
});




}
/// @nodoc
class __$PistaCopyWithImpl<$Res>
    implements _$PistaCopyWith<$Res> {
  __$PistaCopyWithImpl(this._self, this._then);

  final _Pista _self;
  final $Res Function(_Pista) _then;

/// Create a copy of Pista
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? idPista = freezed,Object? nome = null,Object? urlImage = null,Object? local = null,}) {
  return _then(_Pista(
idPista: freezed == idPista ? _self.idPista : idPista // ignore: cast_nullable_to_non_nullable
as int?,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,urlImage: null == urlImage ? _self.urlImage : urlImage // ignore: cast_nullable_to_non_nullable
as String,local: null == local ? _self.local : local // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
