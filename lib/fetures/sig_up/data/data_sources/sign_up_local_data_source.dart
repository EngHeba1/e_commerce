import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/fauilers.dart';
import 'package:e_commerce/fetures/sig_up/data/data_sources/sign_up_data_source.dart';
import 'package:e_commerce/fetures/sig_up/data/models/SignUpModel.dart';

import '../../domain/entities/user_data.dart';

class SignUpLocalDataSource implements SignUpDataSource{
  @override
  Future<Either<Failures, SignUpModel>> signUp(UserData userData) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}