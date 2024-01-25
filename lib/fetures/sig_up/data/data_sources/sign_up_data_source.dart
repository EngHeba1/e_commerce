 import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/fauilers.dart';

import '../../domain/entities/user_data.dart';
import '../models/SignUpModel.dart';

abstract class SignUpDataSource{

   Future<Either<Failures,SignUpModel>>signUp(UserData userData);
 }