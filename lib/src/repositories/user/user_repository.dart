import 'package:clinica_core/clinica_core.dart';

abstract interface class UserRepository {
  Future<Either<AuthExceptions, String>> login(String email, String password);

}