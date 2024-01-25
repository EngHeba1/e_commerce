import 'package:e_commerce/core/utiles/app_color.dart';
import 'package:e_commerce/fetures/sig_up/data/data_sources/sign_up_remot_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/routes/rouets.dart';
import '../../../../core/utiles/images.dart';
import '../../../../core/utiles/test_style.dart';
import '../../../../core/widget/custom_button.dart';
import '../../../../core/widget/custom_text_filed.dart';
import '../manager/cubit/sign_up_cubit.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => SignUpCubit(SignUpRemotDataSource()),
        child: BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) {
      if (state is SignUpLoading) {
        showDialog(
          context: context,
          builder: (context) =>  AlertDialog(
            backgroundColor: Colors.transparent,
            title: Center(
              child: CircularProgressIndicator(
                backgroundColor: AppColor.primary,
              ),
            ),
          ),
        );
      }
      else if (state is SignUpFail) {
        //Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Error"),
            content: Text(state.failure.errorMessage?? ""),
          ),
        );
      }
      else if (state is SignUpSuccess) {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.logIn, (route) => false);
      }

          },
          builder: (context, state) {
            return Scaffold(
             // resizeToAvoidBottomInset: false,
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
                          height: 50.h,
                        ),
                        Text("Full Name", style: AppTextStyle.popines18(),),
                        CustomTextFiled(
                          label: "Enter your full name ",
                          validator: (name) {
                            if (name!.isEmpty) {
                              return "Enter Email";
                            }
                            return null;
                          },
                          controller: SignUpCubit.get(context).nameController,
                        ),
                        Text("Mobile Number", style: AppTextStyle.popines18()),
                        CustomTextFiled(
                          label: "Enter your mobile number. ",
                          validator: (phone) {
                            if (phone!.isEmpty) {
                              return "Enter your phone ";
                            }
                            return null;
                          },
                          controller: SignUpCubit.get(context).phoneController,
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
                          controller: SignUpCubit.get(context).emailController,
                        ),
                        Text("Password", style: AppTextStyle.popines18()),
                        CustomTextFiled(
                            label: "Enter your mobile number. ",
                            validator: (password) {
                              if (password!.isEmpty) {
                                return "Please Enter Password ";
                              }
                              return null;
                            },
                            controller:
                                SignUpCubit.get(context).passwordController,
                            isPassword: true),

                        SizedBox(height: 60.h),
                        CustomButton(text:"Sign up" ,
                          mytextStyle:AppTextStyle.popines20() ,
                          function: (){
                            SignUpCubit.get(context).signUp();
                          },),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Text("I Have an account",style:AppTextStyle.popines18() ,),
                          TextButton(onPressed: (){
                            Navigator.pushNamed(context, Routes.logIn);
                          }, child: Text("Login",style: AppTextStyle.popines18(),))
                        ],)
                      ]),
                ),
              ),
            );
          },
        ));
  }
}
