import 'package:flutter/material.dart';
import 'package:splash_login_sign_up_ui/utils/const/colors_code.dart';

class UpPassField extends StatelessWidget {
  final String? textName;
  final TextEditingController controller;
  const UpPassField({
    super.key,
    this.textName,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "password",
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: RColors.bColors),
            borderRadius: BorderRadius.circular(15),),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: RColors.bColor),
            borderRadius: BorderRadius.circular(15)),
      ),
      validator: (value){
        if(value == "" || value ==null){
          return "enter your valid password";
        }
        return null;
      },
    );
  }
}