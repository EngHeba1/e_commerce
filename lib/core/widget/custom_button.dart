import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
   CustomButton({required this.text,required this.mytextStyle,  this.function});
   final String text;
   final TextStyle mytextStyle;
   void Function()? function;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 65.h,
      onPressed:function,
      child: Text(text,style:mytextStyle ),
    color: Colors.white,
    shape: OutlineInputBorder(borderRadius:BorderRadius.circular(12) ,
    borderSide:const BorderSide(color: Colors.transparent)));
  }
}
