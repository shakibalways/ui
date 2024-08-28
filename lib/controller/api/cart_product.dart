import 'dart:convert';
import 'dart:developer';


import 'package:get/get.dart';
import 'package:splash_login_sign_up_ui/local%20database/secure_storage.dart';
import 'package:splash_login_sign_up_ui/model/show_product_cart.dart';
import 'package:http/http.dart' as http;

class ShowCartService {
  static Future<List<ProductCart>?> showCartService() async {
    try {
      Uri url = Uri.parse("https://cit-ecommerce-codecanyon.bandhantrade.com/api/app/v1/cart/list");
      String token =  await  LocalStorage().readData(key: "token") ?? "";
      var header =  {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization" : "Bearer $token"
      };
      var response = await http.get(url,headers: header);
      if (response.statusCode == 200) {
        ShowProductCartModel jsonData = ShowProductCartModel.fromJson(jsonDecode(response.body));
        return jsonData.productCart ?? [];
      }else if(response.statusCode == 422){
        Get.snackbar("Message", "Already cart added");
        return [];
      }
    } catch (e) {
      e.toString();
    }
    Get.snackbar("Message", "Something went wrong");
    return [];
  }
}
