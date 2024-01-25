
import 'package:dartz/dartz.dart';

import 'package:e_commerce/core/error/fauilers.dart';

import 'package:e_commerce/fetures/log_in/domain/entities/Login_entity.dart';

import '../../domain/repositories/login_domain_repo.dart';
import '../data_sources/login_dto.dart';

class LoginDataRepo implements LogInDomainRepo{
  LogInDto sourses;

  LoginDataRepo(this.sourses);

  @override
  Future<Either<Failures, LoginEntity>> login(String email, String password) =>sourses.logIn(email, password);


}