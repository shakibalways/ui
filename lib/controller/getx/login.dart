import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splash_login_sign_up_ui/controller/api/login_service.dart';
import 'package:splash_login_sign_up_ui/views/pages/home/home.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey =GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  RxBool isLoading = false.obs;

  loginInFun() async {
    isLoading.value = true;
    bool status = await LoginService.getLogin(
        email: emailController.text, password: passController.text);
    isLoading.value = false;

    if (status) {
      log("Next Screen");
      Get.to(const HomePage());
      return;
    }

  }
  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }
}
