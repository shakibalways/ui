import 'package:flutter/material.dart';
import 'package:splash_login_sign_up_ui/utils/const/colors_code.dart';

class UpEmailField extends StatelessWidget {
  final String? textName;
  final TextEditingController controller;
  const UpEmailField({
    super.key,
    this.textName,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "E-mail",
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: RColors.bColors),
            borderRadius: BorderRadius.circular(15),),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: RColors.bColor),
            borderRadius: BorderRadius.circular(15)),
      ),
      validator: (value){
        if(value == "" || value ==null){
          return "email can't be empty";
        } else if (!(value.toString().contains(".") ||
            value.toString().contains("@"))) {
          return "Please enter valid email";
        }
        return null;
      },
    );
  }
}
