import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/data_sources/login_dto.dart';
import '../../data/repositories/login_data_repo.dart';
import '../../domain/repositories/login_domain_repo.dart';
import '../../domain/use_cases/log_in_use_case.dart';
import 'login_state.dart';

class LogInCubit  extends Cubit<loginState>{
  LogInCubit(this.source) : super(LogInInitial());
  LogInDto source;
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  static LogInCubit get(context)=>BlocProvider.of(context);
  
  
  
  void logIn()async {
    emit(LogInLoadingStat());
    LogInDomainRepo logInDomainRepo =LoginDataRepo(source);
    LogInUseCase logInUseCase = LogInUseCase(logInDomainRepo);
    var result = await logInUseCase.call(emailController.text,passwordController.text);
    result.fold((l) {
      emit(LogInFail(l));
    },
            (r) {
          emit(LogInSuccessState(r));
        }
    );
  }

}