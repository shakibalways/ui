

import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:splash_login_sign_up_ui/controller/api/api_url.dart';
import 'package:http/http.dart' as http;

class SignUpService{

static Future<bool> signUpService({required Map<String,dynamic> data})async{
  try{
    Uri url = Uri.parse(ApiUrl.signUpUrl);
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json"
    };
    var body = jsonEncode(data);
    var response = await http.post(url,body:body,headers: headers );
    if(response.statusCode==201){
      Get.snackbar("Message", "Registration Success");
      return true;
    }else if (response.statusCode ==422){
      var responseData = jsonDecode(response.body)['errors'];
      List a = responseData.keys.toList();
      if (a.contains("email")) {
        Get.snackbar("Message", "This Email already used");
        return false;
      } else if (a.contains("phone")) {
        Get.snackbar("Message", "This Phone already used");
        return false;
      }
    }
  }catch(e){
    log(e.toString());
  }
  Get.snackbar("Message", "Something went wrong.");
  return false;
}
}