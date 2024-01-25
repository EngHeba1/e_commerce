
import 'package:dartz/dartz.dart';

import '../../../../core/error/fauilers.dart';
import '../models/login_model.dart';
import 'login_dto.dart';

class LogInLocalDto implements LogInDto{
  @override
  Future<Either<Failures, LoginModel>> logIn(String email, String password) {

    throw UnimplementedError();
  }
}