import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splash_login_sign_up_ui/controller/api/product_discription.dart';
import 'package:splash_login_sign_up_ui/views/pages/auth/log_in/log_in.dart';
import 'package:splash_login_sign_up_ui/views/pages/auth/register/sign_up.dart';
import 'package:splash_login_sign_up_ui/views/pages/cart/show_product.dart';
import 'package:splash_login_sign_up_ui/views/pages/home/home.dart';
import 'package:splash_login_sign_up_ui/views/pages/product_discription/product_discription_page.dart';
import 'package:splash_login_sign_up_ui/views/pages/splash/splash_screen.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
