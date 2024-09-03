import 'dart:convert';
import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splash_login_sign_up_ui/controller/api/api_url.dart';
import 'package:splash_login_sign_up_ui/local%20database/secure_storage.dart';
import 'package:splash_login_sign_up_ui/model/show_product_cart.dart';
import 'package:http/http.dart' as http;

class AddToCartService {
  static Future<bool> addToCartService({required int id}) async {
    try {
      Uri url = Uri.parse("ApiUrl.addToCartProduct");
      String token =  await  LocalStorage().readData(key: "token") ?? "";
      var header =  {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization" : "Bearer $token"
      };
      var data = {
        "product_id": id,
        "product_qty": 1,
      };
      var response = await http.post(url,body: jsonEncode(data),headers: header);
      log('================${response.statusCode}');
      log('================${response.body}');
      if (response.statusCode == 201) {
        ShowProductCartModel jsonData =
            ShowProductCartModel.fromJson(jsonDecode(response.body));
        log("Added Successfully");
       // Get.snackbar("Message", "Added Successfully");

        return true;
      }else if(response.statusCode ==200){
        log("Already added to cart");
        // Get.snackbar("Message", "Already added to cart");
        return true;
      }
    } catch (e) {
      e.toString();
    }
    return false;
  }
}
