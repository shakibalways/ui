import 'dart:convert';
import 'dart:developer';
import 'package:splash_login_sign_up_ui/model/product_discription.dart';
import 'package:http/http.dart' as http;

class ProductDiscription {
  static Future<ProductDetails?> productDiscription({required int id}) async {
    try {
      Uri url = Uri.parse("${"ApiUrl.productDetailsUrl"}/$id");
      var response = await http.get(url);
      if (response.statusCode == 200) {
       ProductDiscriptionModel data = ProductDiscriptionModel.fromJson(jsonDecode(response.body));
       return data.productDetails;
      } else {
        log("Failed to load product details");
      }
    } catch (e) {
      log('Error occurred: $e');
    }
    return null;
  }
}
