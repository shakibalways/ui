
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splash_login_sign_up_ui/component/my_button.dart';
import 'package:splash_login_sign_up_ui/controller/getx/sign_up.dart';
import 'package:splash_login_sign_up_ui/utils/const/colors_code.dart';
import 'package:splash_login_sign_up_ui/views/pages/auth/log_in/widget/same_button.dart';
import 'package:splash_login_sign_up_ui/views/pages/auth/register/widget/confirm_pass_field.dart';
import 'package:splash_login_sign_up_ui/views/pages/auth/register/widget/my_email_field.dart';
import 'package:splash_login_sign_up_ui/views/pages/auth/register/widget/pass-field.dart';
import 'package:splash_login_sign_up_ui/views/pages/auth/register/widget/phone_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Create a new account",
                style: TextStyle(
                    color: RColors.bColors,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: signUpController.formKey,
                child: Column(
                  children: [
                    UpEmailField(controller: signUpController.emailController),
                    const SizedBox(
                      height: 20,
                    ),
                    UpPhoneField(controller: signUpController.phoneController),
                    const SizedBox(
                      height: 20,
                    ),
                    UpPassField(
                        controller: signUpController.passwordController),
                    const SizedBox(
                      height: 20,
                    ),
                    UpConfirmPaasField(
                        controller: signUpController.confirmPassController),
                  ],
                ),
              ),
              const SizedBox(
                height: 40
              ),
              Obx(
                () => signUpController.isLoading.isFalse
                    ? MyButton(
                        text: "Sign Up",
                        onTap: () {
                          if (!signUpController.formKey.currentState!
                              .validate()) {
                            return;
                          }
                          signUpController.signUpFun();
                        })
                    : const SameButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
