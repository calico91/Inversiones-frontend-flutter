import 'package:inversiones/src/domain/responses/auth/sing_in_response.dart';

abstract class SignInRepository {
  const SignInRepository();

  Future<SignInResponse> signInWithUsernameAndPassword(
    String username,
    String password,
  );
  Future<SignInResponse> authBiometrica(
    String username,
    String idMovil,
  );
}
