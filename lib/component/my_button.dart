import 'package:flutter/material.dart';
import 'package:splash_login_sign_up_ui/utils/const/colors_code.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  final Color? color;
  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color ?? Color(int.parse(RColors.buttonColor))),
        child: Center(
          child: Text(
           text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(int.parse(RColors.bColors))),
          ),
        ),
      ),
    );
  }
}
