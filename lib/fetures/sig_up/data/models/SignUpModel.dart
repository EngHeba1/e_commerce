import '../../domain/entities/SignUpEntities.dart';

class SignUpModel extends SignUpEntities {
  SignUpModel({
      this.message, 
      required super.user,
      required super.token,});

  SignUpModel.fromJson (dynamic json) :this(
      token:   json['token'],
      user:    json['user'],
      message: json['message']  );

  String? message;


}

class User extends UserEntitie {
  User({
      this.role, required super.name, required super.email,});

      User.fromJson(dynamic json):this(role: json["role"] ,email:json["email"]  ,name: json["name"]);

     String? role;



}