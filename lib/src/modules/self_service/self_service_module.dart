
import 'package:clinicas_self_service/src/modules/self_service/documents/documents_page.dart';
import 'package:clinicas_self_service/src/modules/self_service/documents/scan/documents_scan_page.dart';
import 'package:clinicas_self_service/src/modules/self_service/documents/scan_confirm/documents_scan_confirm_page.dart';
import 'package:clinicas_self_service/src/modules/self_service/done/done_page.dart';
import 'package:clinicas_self_service/src/modules/self_service/find_patient/find_patient_page.dart';
import 'package:clinicas_self_service/src/modules/self_service/find_patient/find_patient_router.dart';
import 'package:clinicas_self_service/src/modules/self_service/patient/patient_page.dart';
import 'package:clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:clinicas_self_service/src/modules/self_service/self_service_page.dart';
import 'package:clinicas_self_service/src/modules/self_service/who_i_am/who_i_am_page.dart';
import 'package:clinicas_self_service/src/repositories/patients/patient_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class SelfServiceModule extends FlutterGetItModule {

  @override
  List<Bind<Object>> get bindings =>  [
    Bind.lazySingleton((i) => SelfServiceController()),
    Bind.lazySingleton((i) => PatientRepositoryImpl(restClient: i()))
  ];


  @override
  String get moduleRouteName => '/self-service';

  @override
  Map<String, WidgetBuilder> get pages => {
    '/': (context) => const SelfServicePage(),
    '/whoIAm': (context) => const WhoIAmPage(),
    '/find-patient': (context) => const FindPatientRouter(),
    '/patient': (context) => const PatientPage(),
    '/documents': (context) => const DocumentsPage(),
    '/documents/scan': (context) => const DocumentsScanPage(),
    '/documents/scan_confirm': (context) => const DocumentsScanConfirmPage(),
    '/done': (context) => const DonePage(),
  };

}