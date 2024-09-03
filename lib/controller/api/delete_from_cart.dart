import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:splash_login_sign_up_ui/local%20database/secure_storage.dart';


class DeleteFromCartService {
  static Future<bool> cartService({required int id}) async {
    try {
      Uri url = Uri.parse("ApiUrl.deleteFromCartUrl");
      String token = await LocalStorage().readData(key: "token") ?? "";
      var body = {"product_id": id};

      final header = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var response =
      await http.post(url, body: jsonEncode(body), headers: header);
      if (response.statusCode == 201) {
        return true;
      } else if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      log("Error: $e");
    }
    return false;
  }
}