import 'dart:convert';

import 'package:get/get.dart';
import 'package:splash_login_sign_up_ui/model/product.dart';

import 'api_url.dart';
import 'package:http/http.dart' as http;

class AllShopProducts {
  static Future<List<Products>> allShopProducts() async {
    try {
      Uri url = Uri.parse(ApiUrl.productUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var decodeData = jsonDecode(response.body);
        ProductModel jsonData = ProductModel.fromJson(decodeData);
        Get.snackbar("Message","Success");
        return jsonData.products ?? [];
      }
    } catch (e) {
      e.toString();
    }
    await Get.snackbar("Message","Something went wrong..!!");
    return [];
  }
}
