import '../../../../core/error/fauilers.dart';
import '../../domain/entities/Login_entity.dart';


abstract class loginState{}
final class LogInInitial extends loginState {}
final class LogInSuccessState extends loginState {

  LoginEntity loginEntity;

  LogInSuccessState(this.loginEntity);
}
final class LogInLoadingStat extends loginState {

}
final class LogInFail extends loginState {
  Failures failure;

  LogInFail(this.failure);
}
