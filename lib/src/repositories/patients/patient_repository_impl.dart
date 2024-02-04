import 'dart:developer';

import 'package:clinica_core/clinica_core.dart';
import 'package:clinicas_self_service/src/model/patient_model.dart';
import 'package:clinicas_self_service/src/repositories/patients/patient_repository.dart';
import 'package:dio/dio.dart';

class PatientRepositoryImpl implements PatientRepository {
  final RestClient restClient;

  PatientRepositoryImpl({required this.restClient});

  @override
  Future<Either<RepositoryException, PatientModel?>> findPatientbyDocument(
      String document) async {
    try {
      final Response(:List data) = await restClient.auth
          .get('/patient', queryParameters: {'document': document});

        if (data.isEmpty) {
          return Right(null);
        }
        return Right(PatientModel.fromJson(data.first));

    } on DioException catch (e, s) {
      log('Erro ao buscar paciente por cpf', error: e, stackTrace: s);
      return Left(RepositoryException());
    }
  }
}
