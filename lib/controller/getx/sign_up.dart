import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splash_login_sign_up_ui/controller/api/sign_up_service.dart';
import 'package:splash_login_sign_up_ui/views/pages/auth/log_in/log_in.dart';

class SignUpController extends GetxController{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  RxBool isLoading = false.obs;
  signUpFun() async {
    Map<String, dynamic> data = {
      "email": emailController.text,
      "phone": phoneController.text,
      "password": passwordController.text,
      "password_confirmation": confirmPassController.text,

    };
    isLoading.value = true;
    bool status = await SignUpService.signUpService(data: data);
    isLoading.value = false;

    if (status) {
      log("Next Page");
      Get.to(() => const LogInPage());
      return;
    }
  }
@override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }
}