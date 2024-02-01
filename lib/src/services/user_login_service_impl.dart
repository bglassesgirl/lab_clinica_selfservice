import 'package:clinica_core/clinica_core.dart';
import 'package:clinicas_self_service/src/repositories/user/user_repository.dart';
import 'package:clinicas_self_service/src/services/user_login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLoginServiceImpl implements UserLoginService {
  final UserRepository userRepository;

  UserLoginServiceImpl({
    required this.userRepository,
  });

  @override
  Future<Either<ServiceException, Unit>> execute(
      String email, String password) async {
    final loginResult = await userRepository.login(email, password);

    switch (loginResult) {
      // ignore: unused_local_variable
      case Left(value: AuthError(:var message)):
        return Left(ServiceException(message: 'Erro ao realizar login'));
      case Left(value: AuthUnautrorizedException()):
        return Left(ServiceException(message: 'Login ou senha inválido'));
      case Right(value: final accessToken):
        final sp = await SharedPreferences.getInstance();
        sp.setString(LocalStorageConstant.accessToken, accessToken);
        return Right(unit);
    }
  }
}
