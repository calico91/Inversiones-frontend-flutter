import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:inversiones/src/domain/entities/client.dart';
import 'package:inversiones/src/domain/entities/user_details.dart';
import 'package:inversiones/src/domain/repositories/secure_storage_repository.dart';

class SecureStorageLocal implements SecureStorageRepository {
  const SecureStorageLocal({this.secureStorage = const FlutterSecureStorage()});

  final FlutterSecureStorage secureStorage;

  static String? _jwtToken;

  @override
  Future<String?> get jwtToken async {
    return _jwtToken ??= await secureStorage.read(key: 'jwtToken');
  }

  @override
  Future<void> saveToken(String? token) {
    _jwtToken = token == null ? null : 'Bearer $token';
    return secureStorage.write(key: 'jwtToken', value: _jwtToken);
  }

  @override
  Future<void> saveUserDetails(UserDetails? userDetails) async {
    return secureStorage.write(
      key: 'userDetails',
      value: jsonEncode(userDetails!.toJson()),
    );
  }

  @override
  Future<UserDetails?> get userDetails async {
    final user = await secureStorage.read(key: 'userDetails');
    if (user?.isNotEmpty ?? false) {
      return UserDetails.fromJson(jsonDecode(user!) as Map<String, dynamic>);
    }
    return null;
  }

  @override
  Future<String?> get idMovil async => await secureStorage.read(key: 'idMovil');

  @override
  Future<void> saveIdMovil(String? idMovil) =>
      secureStorage.write(key: 'idMovil', value: idMovil);

  @override
  Future<void> saveListaClientes(List<Client>? listaClientes) async {
    return secureStorage.write(
        key: 'listaClientes',
        value: jsonEncode(
            listaClientes?.map((cliente) => cliente.toJson()).toList()));
  }

  @override
  Future<List<Client>> get listaClientes async {
    final listaClientesJson = await secureStorage.read(key: 'listaClientes');
    if (listaClientesJson != null || (listaClientesJson?.isNotEmpty ?? false)) {
      final List<dynamic> objetosList =
          jsonDecode(listaClientesJson!) as List<dynamic>;
      return objetosList
          .map((e) => Client.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return [];
  }

  @override
  Future<void> saveUsuarioBiometria(String? usuarioBiometria) =>
      secureStorage.write(key: 'usuarioBiometria', value: usuarioBiometria);

  @override
  Future<String?> get usuarioBiometria async =>
      await secureStorage.read(key: 'usuarioBiometria');

  @override
  Future<void> saveUrlServidor(String? urlServidor) =>
      secureStorage.write(key: 'urlServidor', value: urlServidor);

  @override
  Future<String?> get urlServidor async =>
      await secureStorage.read(key: 'urlServidor');
}
