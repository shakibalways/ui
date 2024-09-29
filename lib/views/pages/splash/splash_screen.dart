import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splash_login_sign_up_ui/component/my_button.dart';
import 'package:splash_login_sign_up_ui/controller/getx/splash.dart';
import 'package:splash_login_sign_up_ui/utils/const/colors_code.dart';
import 'package:splash_login_sign_up_ui/views/pages/auth/log_in/log_in.dart';
import 'package:splash_login_sign_up_ui/views/pages/auth/register/sign_up.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController splashScreenController = Get.put(SplashController());
    return Scaffold(
        backgroundColor: RColors.bColors,
        body: Obx(() => splashScreenController.isLoading.isFalse
            ? Stack(
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
                          decoration: const BoxDecoration(
                              color: RColors.bColor, shape: BoxShape.circle),
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
                          height: 20
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
                          onTap: () {
                            Get.to(const LogInPage());
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        MyButton(
                          text: 'Sign Up',
                          color: RColors.bColor,
                          onTap: () {
                            Get.to(const SignUpPage());
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              )));
  }
}
