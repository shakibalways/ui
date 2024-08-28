import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splash_login_sign_up_ui/component/my_button.dart';

import 'package:splash_login_sign_up_ui/controller/getx/login.dart';
import 'package:splash_login_sign_up_ui/utils/const/colors_code.dart';
import 'package:splash_login_sign_up_ui/views/pages/auth/log_in/widget/my_email_field.dart';
import 'package:splash_login_sign_up_ui/views/pages/auth/log_in/widget/my_pass_field.dart';
import 'package:splash_login_sign_up_ui/views/pages/auth/log_in/widget/same_button.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login Now",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: RColors.bColors),
              ),
              SizedBox(
                height: 50,
              ),
              Form(
                key: loginController.formKey,
                child: Column(
                  children: [
                    MyEmailField(
                      controller: loginController.emailController,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    MyPassField(
                      controller: loginController.passController,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Obx( ()=> loginController.isLoading.isFalse ?
                       MyButton(
                          text: "Login",
                          onTap: () {
                            if (!loginController.formKey.currentState!
                                .validate()) {
                              return;
                            }
                            loginController.loginInFun();
                          }): const SameButton(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
