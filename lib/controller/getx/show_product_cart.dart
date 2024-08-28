import 'package:get/get.dart';
import 'package:splash_login_sign_up_ui/controller/api/cart_product.dart';
import 'package:splash_login_sign_up_ui/controller/api/delete_from_cart.dart';

import 'package:splash_login_sign_up_ui/model/show_product_cart.dart';

class ShowCartController extends GetxController{
  List<ProductCart>? productCart;
  RxBool isLoading = false.obs;

  RxInt qty = 1.obs;
   RxList<ProductCart> cart = <ProductCart>[].obs;
  RxDouble totalPrice = 0.00.obs;

  getShowCart()async{
    isLoading.value = true;
   productCart = await ShowCartService.showCartService();
    isLoading.value = false;
  }


  deleteFromCart({required int id})async{
    isLoading.value = true;
    bool status  = await DeleteFromCartService.cartService(id: id);
    isLoading.value = false;
    if(status){
      getShowCart();
    }
  }
  // void removeFromCart(ProductCart cartItem) {
  //
  //   if (cartItem != -1) {
  //     if (cartItem.quantity! > 1) {
  //       cartItem.quantity --;
  //     } else {
  //       cart.removeAt(cartItem);
  //     }
  //   }
  // }
  @override
  void onInit() {
    getShowCart();
    super.onInit();
  }
}