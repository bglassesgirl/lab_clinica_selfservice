
import 'package:asyncstate/asyncstate.dart';
import 'package:clinica_core/clinica_core.dart';
import 'package:clinicas_self_service/src/services/user_login_service.dart';
import 'package:signals_flutter/signals_flutter.dart';

class LoginController with MessageStateMixin {

  LoginController({
    required UserLoginService loginService,
  }) : _loginService = loginService;

  final UserLoginService _loginService;

  final _obscurePassword = signal(true);
  final _logged = signal(false);

  bool get logged => _logged();
  bool get obscurePassword => _obscurePassword();

   void passwordToggle() => _obscurePassword.value = !_obscurePassword.value;

   void login(String email, String password) async {
    final loginResult = await _loginService.execute(email, password).asyncLoader();

    switch(loginResult){
        // ignore: unused_local_variable
        case Left(value: ServiceException(:final message)):
          showError(message);
        case Right(value: _):
        _logged.value = true;

    }
   }

}