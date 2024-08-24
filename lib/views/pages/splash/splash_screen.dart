import 'package:flutter/material.dart';
import 'package:splash_login_sign_up_ui/component/my_button.dart';
import 'package:splash_login_sign_up_ui/utils/const/colors_code.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(int.parse(RColors.bColors)),
      body: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 120,
                child: Container(
                  margin: const EdgeInsets.only(top: 50),
                  height: MediaQuery.of(context).size.height * 0.60,
                  width: MediaQuery.of(context).size.width * 0.90,
                  decoration: BoxDecoration(
                      color: Color(int.parse(RColors.bColor)),
                      shape: BoxShape.circle),
                ),
              ),
              Positioned(
                top: 180,
                left: 120,
                child: Image.asset(
                  "assets/images/ciclye.png",
                  height: 380,
                  width: 380,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Let's\nget Started",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Everything start from here",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 40,
                ),
                MyButton(
                  text: 'Login',
                  onTap: () {},
                ),
                const SizedBox(
                  height: 30,
                ),
                MyButton(
                  text: 'Sign Up',
                  color: Color(int.parse((RColors.bColor))),
                  onTap: () {},
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
