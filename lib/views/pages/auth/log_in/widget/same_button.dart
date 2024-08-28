import 'package:flutter/material.dart';
import 'package:splash_login_sign_up_ui/utils/const/colors_code.dart';

class SameButton extends StatelessWidget {
  final Color? color;
  const SameButton({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color ?? RColors.buttonColor),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
