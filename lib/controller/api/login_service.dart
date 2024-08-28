import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'package:splash_login_sign_up_ui/controller/api/api_url.dart';
import 'package:splash_login_sign_up_ui/local%20database/secure_storage.dart';

class LoginService {
  static Future<bool> getLogin(
      {required String email, required String password}) async {
    try {
      Uri url = Uri.parse(ApiUrl.signInUrl);
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Accept": "application/json"
      };
      var body = {
        "email_phone": email,
        "password": password,
      };
      var response =await http.post(url, body: jsonEncode(body), headers: headers);
      if(response.statusCode ==200){
        var jsonData = jsonDecode(response.body);
        log("${jsonData.runtimeType}");
        log("${response.statusCode}");
        Get.snackbar("Message", "Success");
        log("---------------- ${jsonData['token']}");
        await LocalStorage().writeData(key: "token", value: jsonData['token']);
        return true;
      } else if(response.statusCode == 401){
        Get.snackbar("Message", "Wrong user");
        return false;
      }
    } catch (e) {
      log(e.toString());
    }
    Get.snackbar("Message", "Something went wrong.");
    return false;
  }
}
