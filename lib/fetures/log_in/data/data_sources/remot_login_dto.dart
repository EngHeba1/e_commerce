

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/fetures/log_in/data/models/login_model.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/error/fauilers.dart';
import '../../../../core/utiles/app_constant.dart';
import 'login_dto.dart';

class LogInRemotDto implements LogInDto{
  Dio dio=Dio();


  @override
  Future<Either<Failures, LoginModel>> logIn(String email, String password) async {

    try {
      var response=await dio.post("${Constants.baseUrl}${EndPoints.logIn}",
          data: {
            "email":   email,
            "password":password,
          });
      LoginModel loginModel=LoginModel.fromJson(response.data);
      return Right(loginModel);
    } on Exception catch (e) {
     return Left(ServerFailure(e.toString()));
    }
  }
}