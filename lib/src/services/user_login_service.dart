import 'package:clinica_core/clinica_core.dart';

abstract interface class UserLoginService {
  Future<Either<ServiceException, Unit>> execute(String email, String password);
}