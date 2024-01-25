import 'package:dartz/dartz.dart';

import 'package:e_commerce/core/error/fauilers.dart';

import 'package:e_commerce/fetures/sig_up/domain/entities/SignUpEntities.dart';

import '../../domain/entities/user_data.dart';
import '../../domain/repositories/sign_up_domain_repo.dart';
import '../data_sources/sign_up_data_source.dart';
import '../models/SignUpModel.dart';

class SignUpDataRepo implements SignUpDomainRepo{
  SignUpDataSource source;
  SignUpDataRepo(this.source);

  @override
  Future<Either< Failures , SignUpModel >> signUp(UserData userData) => source.signUp(userData);

}