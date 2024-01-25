import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/error/fauilers.dart';
import 'package:e_commerce/fetures/sig_up/data/data_sources/sign_up_data_source.dart';
import 'package:e_commerce/fetures/sig_up/data/models/SignUpModel.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/utiles/app_constant.dart';
import '../../domain/entities/user_data.dart';

class SignUpRemotDataSource implements SignUpDataSource{
  Dio dio=Dio();
  @override
  Future<Either<Failures,SignUpModel>> signUp(UserData userData)async {
   try {
     var response= await dio.post("${Constants.baseUrl}${EndPoints.signUp}",
         data: {
       "name":    userData.name,
       "email":   userData.email,
       "password":userData.password,
       "phone":   userData.phone
     });
     SignUpModel signUpModel=  SignUpModel.fromJson(response.data) ;
     return Right(signUpModel);
   } on Exception catch (e) {
    return Left(ServerFailure(e.toString()));
   }
   
  }
}