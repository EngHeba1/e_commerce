import 'package:equatable/equatable.dart';

class SignUpEntities extends Equatable{
  SignUpEntities({
      required this.user,
      required this.token,});

  UserEntitie user;
  String token;

  @override

  List<Object?> get props => [user,token];

}

class UserEntitie extends Equatable{
  UserEntitie({
      required this.name,
      required this.email,});


  String name;
  String email;

  @override

  List<Object?> get props => [name,email];




}