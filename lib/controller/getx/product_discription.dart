import 'package:get/get.dart';
import 'package:splash_login_sign_up_ui/controller/api/add_to_cart.dart';
import 'package:splash_login_sign_up_ui/controller/api/product_discription.dart';
import 'package:splash_login_sign_up_ui/model/product_discription.dart';

class ProductDescriptionController extends GetxController {
 ProductDetails? productDetails;
  var isLoading = true.obs;
  RxList<dynamic> image = [].obs;



   getProductDiscription() async {
   isLoading.value = true;
   var data = Get.arguments ?? 0;
   productDetails = await ProductDiscription.productDiscription(id: data);
   image(productDetails?.images);
   isLoading.value =false;
  }
  addToCartFun({required int id})async{
   bool status = await AddToCartService.addToCartService(id: id);
  }
 @override
 void onInit() {
  getProductDiscription();
  super.onInit();
 }
}

