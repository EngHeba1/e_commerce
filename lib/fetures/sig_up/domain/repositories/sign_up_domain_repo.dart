import 'package:dartz/dartz.dart';

import '../../../../core/error/fauilers.dart';
import '../entities/SignUpEntities.dart';
import '../entities/user_data.dart';

abstract class SignUpDomainRepo{

   Future<Either<Failures,SignUpEntities>> signUp(UserData userData);
}