import 'package:flutter/material.dart';
import 'package:splash_login_sign_up_ui/utils/const/colors_code.dart';

class UpPhoneField extends StatelessWidget {
  final String? textName;
  final TextEditingController controller;
  const UpPhoneField({
    super.key,
    this.textName,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "phone",
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: RColors.bColors),
            borderRadius: BorderRadius.circular(15),),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: RColors.bColor),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      validator: (value) {
        if (value == null || value == '') {
          return "phone_error";
        } else if (value.toString().length < 11) {
          return "wrong_data_insert_error";
        }
        return null;
      },
    );
  }
}
