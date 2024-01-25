import 'package:dartz/dartz.dart';

import '../../../../core/error/fauilers.dart';
import '../entities/SignUpEntities.dart';
import '../entities/user_data.dart';
import '../repositories/sign_up_domain_repo.dart';

class SignUpUseCase{
  SignUpDomainRepo signUpDomainRepo;

  SignUpUseCase(this.signUpDomainRepo);

        Future<Either<Failures,SignUpEntities>>call(UserData userData)=> signUpDomainRepo.signUp( userData);  //هو سماها كول لأنها مبتعملش حاجه غير بتنده علي الي في الربو

}