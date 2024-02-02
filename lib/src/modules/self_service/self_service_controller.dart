import 'package:clinica_core/clinica_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

enum FormSteps {
  none,
  whoIAm,
  findPatient,
  patient,
  documents,
  done,
  restart,
}
class SelfServiceController with MessageStateMixin {
  final _step = ValueSignal(FormSteps.none);

  FormSteps get step => _step();

  void startProcess (){
    _step.forceUpdate(FormSteps.whoIAm);
  }

  void goPatient(){
    _step.forceUpdate(FormSteps.patient);
  }
}