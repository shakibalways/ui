import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splash_login_sign_up_ui/controller/getx/all_shop_product.dart';
import 'package:splash_login_sign_up_ui/views/pages/cart/show_product.dart';
import 'package:splash_login_sign_up_ui/views/pages/product_discription/product_discription_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AllShopProductController controller =
      Get.put(AllShopProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All Shop Products",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: Colors.pink,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(const ShowCartPage());
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 35,
              ))
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                itemCount: controller.products!.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.72,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  var data = controller.products![index];
                  return GestureDetector(
                    onTap: () {
                      int id = controller.products?[index].productId ?? 0;
                      Get.to(
                          ProductDescriptionPage(
                            productData: data,
                            id: id,
                          ),
                          arguments: id);
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                              "https://cit-ecommerce-codecanyon.bandhantrade.com/${data.image}"),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  maxLines: 1,
                                  data.nameEn.toString(),
                                  style: const TextStyle(),
                                ),
                                Text("Model: ${data.rating ?? ""}"),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${data.regPrice.toString()} ৳",
                                  style: const TextStyle(),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },),
      ),
    );
  }
}
