import 'package:flutter/material.dart';
import 'package:splash_login_sign_up_ui/utils/const/colors_code.dart';

class UpConfirmPaasField extends StatelessWidget {
  final String? textName;
  final TextEditingController controller;
  const UpConfirmPaasField({
    super.key,
    this.textName,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "confirm_password",
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: RColors.bColors),
            borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: RColors.bColor),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      // validator: (value) {
      //   // if (value == null || value == '') {
      //   //   return "confirm_pass_error".tr;
      //   // } else if (value.toString() != password) {
      //   //   return "pass_did_not_match_error".tr;
      //   // }
      //   // return null;
      // },
    );
  }
}
