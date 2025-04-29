// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Usuario _$UsuarioFromJson(Map<String, dynamic> json) => _Usuario(
  idUsuario: (json['id_usuario'] as num).toInt(),
  nome: json['nome'] as String,
  email: json['email'] as String,
);

Map<String, dynamic> _$UsuarioToJson(_Usuario instance) => <String, dynamic>{
  'id_usuario': instance.idUsuario,
  'nome': instance.nome,
  'email': instance.email,
};
