import 'package:clinicas_self_service/src/modules/self_service/patient/patient_page.dart';
import 'package:flutter/material.dart';

mixin PatientFormController on State<PatientPage>{
    final nameEC = TextEditingController();
    final emailEC = TextEditingController();
    final phoneEC = TextEditingController();
    final documentEC = TextEditingController();
    final addressEC = TextEditingController();
    final cepEC = TextEditingController();
    final streetEC = TextEditingController();
    final numberEC = TextEditingController();
    final complementEC = TextEditingController();
    final stateEC = TextEditingController();
    final cityEC = TextEditingController();
    final districtEC = TextEditingController();
    final guardianEC = TextEditingController();
    final guardianIdenticationNumberEC = TextEditingController();

  void disposeFomr() {
     nameEC.dispose();
     emailEC.dispose();
     phoneEC.dispose();
     documentEC.dispose();
     addressEC.dispose();
     cepEC.dispose();
     streetEC.dispose();
     numberEC.dispose();
     complementEC.dispose();
     stateEC.dispose();
     cityEC.dispose();
     districtEC.dispose();
     guardianEC.dispose();
     guardianIdenticationNumberEC.dispose();

   }
}
