import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
   CustomTextFiled({required this.label,this.controller,this.validator, this.isPassword=false});
  TextEditingController? controller;
  String label;
  bool isPassword ;
  String?Function(String?)? validator ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius:BorderRadius.circular(12) ,
            borderSide:const BorderSide(color: Colors.transparent) )
      ),
    );
  }
}
