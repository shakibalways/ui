import 'package:get/get.dart';
import 'package:splash_login_sign_up_ui/local%20database/secure_storage.dart';
import 'package:splash_login_sign_up_ui/views/pages/auth/register/sign_up.dart';
import 'package:splash_login_sign_up_ui/views/pages/home/home.dart';

class SplashController extends GetxController{
RxBool isLoading = false.obs;


  Future getNextPage() async {
    String token =  await  LocalStorage().readData(key: "token") ?? "";
    isLoading.value= true;
    await Future.delayed(const Duration(seconds: 0));
    isLoading.value= false;
    if(token.isNotEmpty || token != ""){
      Get.to(() => const HomePage());
    }else{
      Get.to(() => const SignUpPage());
    }

  }
  @override
  void onInit() {
    getNextPage();
    super.onInit();
  }

}