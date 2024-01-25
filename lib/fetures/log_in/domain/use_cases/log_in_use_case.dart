
import 'package:dartz/dartz.dart';

import '../../../../core/error/fauilers.dart';
import '../entities/Login_entity.dart';
import '../repositories/login_domain_repo.dart';

class LogInUseCase{
  LogInDomainRepo logInDomainRepo;

  LogInUseCase(this.logInDomainRepo);

  Future<Either<Failures, LoginEntity>> call(String email,String password)=>logInDomainRepo.login(email, password);
}