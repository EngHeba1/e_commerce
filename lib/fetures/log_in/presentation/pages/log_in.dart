
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/routes/rouets.dart';
import '../../../../core/utiles/app_color.dart';
import '../../../../core/utiles/app_strings.dart';
import '../../../../core/utiles/images.dart';
import '../../../../core/utiles/test_style.dart';
import '../../../../core/widget/custom_button.dart';
import '../../../../core/widget/custom_text_filed.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogInCubit, loginState>(
      listener: (context, state) {
        if (state is LogInLoadingStat) {
          showDialog(
            context: context,
            builder: (context) =>
                AlertDialog(
                  backgroundColor: Colors.transparent,
                  title: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: AppColor.primary,
                    ),
                  ),
                ),
          );
        }
        else if(state is LogInFail){
           Navigator.pop(context);
           showDialog(
               context: context,
               builder:(context) =>  AlertDialog(
                 backgroundColor: Colors.transparent,
                 title: const Center(child:  Text("Error"),
                 ),
                 content: Center(child: Text (state.failure.errorMessage.toString())),

               ));
        }
        else if(state is LogInSuccessState){
          //Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(context, Routes.home,(route) => false,);
        }
      }, builder: (BuildContext context, loginState state) {
        return  Scaffold(
          backgroundColor: AppColor.primary,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 85.h,
                  ),
                  Image.asset(
                    AppImages.logo,
                    height: 100.h,
                    width: 237.w,
                  ),
                  SizedBox(
                    height: 85.h,
                  ),
                  Text(AppStrings.welcome,style: AppTextStyle.popines18(),),
                  Text(AppStrings.welcome1,style: AppTextStyle.popines18().copyWith(fontSize: 13,
                      fontWeight: FontWeight.w300),),
              
                  SizedBox(
                    height: 50.h,
                  ),
                  Text("E-mail address", style: AppTextStyle.popines18()),
                  CustomTextFiled(
                    label: "Enter your email address ",
                    validator: (value) {
                      bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!);
                      if (value == null || value.isEmpty || !emailValid) {
                        return "Please Enter valid Email Address";
                      }
                      return null;
                    },
                    controller: LogInCubit.get(context).emailController,
                  ),
                  SizedBox(height: 30.h,),
                  Text("Password", style: AppTextStyle.popines18()),
                  CustomTextFiled(
                      label: "Enter your password. ",
                      validator: (password) {
                        if (password!.isEmpty) {
                          return "Please Enter Password ";
                        }
                        return null;
                      },
                      controller:LogInCubit.get(context).passwordController,
                      isPassword: true),
                      Row(
                        children: [
                          Spacer(),
                          TextButton(
                                            child: Text("Forget Password",
                          style: AppTextStyle.popines18(),
                                            ),
                                            onPressed: () {},
                                          ),
                        ],
                      ),
                  SizedBox(height: 56.h,),
                  CustomButton(text:"Log In" ,
                    mytextStyle:AppTextStyle.popines20() ,
                    function: (){
                      LogInCubit.get(context).logIn();
                    },),
                  TextButton(onPressed: () => Navigator.pushNamed(context, Routes.signUp),
                      child: Text(AppStrings.string3,style:AppTextStyle.popines18().copyWith(color: Colors.white) ,)),
                ],
              
              ),
            ),
          ),
        );
    },
    );
  }}