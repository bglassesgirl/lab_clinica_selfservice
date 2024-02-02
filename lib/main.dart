import 'dart:async';
import 'dart:developer';

import 'package:clinica_core/clinica_core.dart';
import 'package:clinicas_self_service/src/binding/clinica_application_binding.dart';
import 'package:clinicas_self_service/src/core/env.dart';
import 'package:clinicas_self_service/src/modules/auth/auth_module.dart';
import 'package:clinicas_self_service/src/modules/home/home_module.dart';
import 'package:clinicas_self_service/src/modules/self_service/self_service_module.dart';
import 'package:clinicas_self_service/src/pages/splash_pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

void main() {
  runZonedGuarded(() {
    runApp(const ClinicaSelfServiceApp());
  }, (error, stack) {
    log('Erro náo tratado', error: error, stackTrace: stack);
  });

}

class ClinicaSelfServiceApp extends StatelessWidget {
  const ClinicaSelfServiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    Env.backendBaseUrl;
    return ClinicasCoreConfig(
      title: 'Lab Clinicas Auto Atendimento',
      binding: ClinicaApplicationBinding(),
      pagesBuilders: [
        FlutterGetItPageBuilder(
          page: (_) => const SpashPage(),
          path: '/',
        )
      ],
      modules: [AuthModule(), HomeModule(), SelfServiceModule()],
    );
  }
}
