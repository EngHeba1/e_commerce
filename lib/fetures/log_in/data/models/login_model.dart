
import '../../domain/entities/Login_entity.dart';

class LoginModel extends LoginEntity {
  String message;
  LoginModel({required this.message,required super.user,required super.token});

  LoginModel.fromJson(Map<String, dynamic>json) :this(
  message: json["message"], user:json["user"],token: json["token"] );






}

class User extends UserEntity{
  String role;
  User({
      required this.role, required super.name, required super.email,});

  User.fromJson(Map<String, dynamic>json) :this(
     role: json["role"],
      name:json["name"] ,
      email:json["email"],
     );





}