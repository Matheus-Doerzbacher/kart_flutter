import 'package:freezed_annotation/freezed_annotation.dart';

part 'usuario.freezed.dart';
part 'usuario.g.dart';

@freezed
sealed class Usuario with _$Usuario {
  factory Usuario({
    @JsonKey(name: 'id_usuario') required int idUsuario,
    required String nome,
    required String email,
  }) = _Usuario;

  factory Usuario.fromJson(Map<String, dynamic> json) =>
      _$UsuarioFromJson(json);
}
