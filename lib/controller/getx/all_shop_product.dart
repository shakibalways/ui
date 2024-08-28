import 'package:get/get.dart';
import 'package:splash_login_sign_up_ui/controller/api/all_shop_products.dart';
import 'package:splash_login_sign_up_ui/model/product.dart';

class AllShopProductController extends GetxController{
  // List<Products> productList = <Products>[].obs;
  List<Products>? products;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    getProducts();
    super.onInit();
  }
  getProducts()async{
    isLoading.value = true;
    products = await AllShopProducts.allShopProducts();
    isLoading.value = false;
  }



}