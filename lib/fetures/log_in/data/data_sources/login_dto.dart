import 'package:dartz/dartz.dart';
import '../../../../core/error/fauilers.dart';
import '../models/login_model.dart';

abstract class LogInDto{

  Future<Either<Failures, LoginModel>> logIn(String email,String password);

}