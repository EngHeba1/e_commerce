
import 'package:dartz/dartz.dart';
import '../../../../core/error/fauilers.dart';
import '../entities/Login_entity.dart';

abstract class LogInDomainRepo{
   Future<Either<Failures,LoginEntity>>login(String email, String password);
}