import 'package:clinica_core/clinica_core.dart';
import 'package:clinicas_self_service/src/binding/clinica_application_binding.dart';
import 'package:clinicas_self_service/src/core/env.dart';
import 'package:clinicas_self_service/src/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

void main() {
  runApp(const ClinicaSelfService());
}

class ClinicaSelfService extends StatelessWidget {
  const ClinicaSelfService({super.key});

  @override
  Widget build(BuildContext context) {
    Env.backendBaseUrl;
    return ClinicasCoreConfig(
      title: 'Lab Clinicas Auto Atendimento',
      biding: ClinicaApplicationBinding(),
      pagesBuilders: [
        FlutterGetItPageBuilder(
          page: (_) => const SpashPage(),
          path: '/',
        )
      ],
    );
  }
}