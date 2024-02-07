
import 'package:clinica_core/clinica_core.dart';
import 'package:clinicas_self_service/src/repositories/patients/patient_repository.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../../../model/patient_model.dart';

class PatientController with MessageStateMixin {
     PatientController({
      required PatientRepository repository,
     }) : _repository = repository;

     final PatientRepository _repository;
     PatientModel? patient;
     final _nextStep = signal<bool>(false);
     bool get nextStep => _nextStep();

     void goNextStep(){
       _nextStep.value = true;
     }

     Future<void> updateAndNext(PatientModel model) async {
        final updateResult = await _repository.update(model);

        switch (updateResult) {
          case Left():
            showError('Erro ao atualizar dados do paciente, chame o atendente');
          case Right():
            showError('Paciente atualizado com sucesso!');
            patient = model;
            goNextStep();
        }
     }
}