import 'dart:developer';
import 'dart:io';
import 'package:clinica_core/clinica_core.dart';
import 'package:clinicas_self_service/src/repositories/user/user_repository.dart';
import 'package:dio/dio.dart';

class UserRepositoryImpl implements UserRepository {
  final RestClient restClient;

  UserRepositoryImpl({required this.restClient});

  @override
  Future<Either<AuthExceptions, String>> login(
      String email, String password) async {
    try {
      final Response(data: {'access_token': accessToken}) =
          await restClient.unAuth.post('/auth', data: {
        'email': email,
        'password': password,
        'admin': true,
      });

      return Right(accessToken);
    } on DioException catch (e, s) {
      log('Erro ao realizar login', error: e, stackTrace: s);

      return switch (e) {
        DioException(response: Response(statusCode: HttpStatus.forbidden)?) =>
          Left(AuthUnautrorizedException()),
        _ => Left(AuthError(message: 'Erro ao realizar login'))
      };
    }
  }
}
