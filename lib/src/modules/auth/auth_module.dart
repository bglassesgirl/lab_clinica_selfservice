import 'package:clinicas_self_service/src/repositories/user/user_repository.dart';
import 'package:clinicas_self_service/src/repositories/user/user_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'login/login_router.dart';

class AuthModule extends FlutterGetItModule {
 @override
  List<Bind<Object>> get bindings =>  [
    Bind.lazySingleton<UserRepository>(
      (i) => UserRepositoryImpl(restClient: i()))

  ];

  @override
  String get moduleRouteName => '/auth';

  @override
  Map<String, WidgetBuilder> get pages => {
      '/login': (_) => const LoginRouter()
  };


}