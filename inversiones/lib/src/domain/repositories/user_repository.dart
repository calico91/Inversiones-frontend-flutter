import 'package:inversiones/src/domain/entities/user.dart';
import 'package:inversiones/src/domain/request/cambiar_contrasena_request.dart';
import 'package:inversiones/src/domain/request/vincular_dispositivo_request.dart';
import 'package:inversiones/src/domain/responses/api_response.dart';
import 'package:inversiones/src/domain/responses/generico_response.dart';

abstract class UserRepository {
  const UserRepository();

  Future<GenericoResponse> vincularDispositivo(
      VincularDispositivoRequest vincularDispositivoRequest);

  Future<GenericoResponse> cambiarContrasena(
      CambiarContrasenaRequest cambiarContrasenaRequest);
  Future<ApiResponse<User>> registrarUsuario(User user);
  Future<ApiResponse<List<User>>> consultarUsuarios();
  Future<ApiResponse<User>> consultarUsuario(int id);
  Future<ApiResponse<User>> actualizarUsuario(User user);
  Future<ApiResponse<String>> cambiarEstado(int id);
  Future<ApiResponse<String>> reinicarContrasena(int id);
}
