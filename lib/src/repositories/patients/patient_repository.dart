import 'package:clinica_core/clinica_core.dart';
import 'package:clinicas_self_service/src/model/patient_model.dart';

abstract interface class PatientRepository {
    Future<Either<RepositoryException, PatientModel?>> findPatientbyDocument(String document);
}