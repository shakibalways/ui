import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:splash_login_sign_up_ui/controller/getx/show_product_cart.dart';

class ShowCartPage extends StatelessWidget {
  const ShowCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    ShowCartController showCartController = Get.put(ShowCartController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text(
          "Shopping Cart",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => showCartController.isLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : showCartController.productCart!.isEmpty
                ? const Center(
                    child: Text(
                      "Empty",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Item:${showCartController.productCart?.length}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: showCartController.productCart?.length,
                            itemBuilder: (context, index) {
                              var data = showCartController.productCart?[index];
                              return SizedBox(
                                height: 180,
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.network(
                                              "${"ApiUrl.baseIP"}/${data?.productImage}",
                                              height: 120,
                                              width: 120,
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${data?.productName?.en}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              "${data?.discountPrice} ৳",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              "${data?.salePrice} ৳",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: Colors.deepOrange),
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            showCartController.deleteFromCart(
                                                id: showCartController
                                                        .productCart?[index]
                                                        .productId ??
                                                    0);
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                            size: 30,
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                  color: Colors.deepOrange,
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Center(
                                                  child: IconButton(
                                                      onPressed: () {
                                                        showCartController
                                                            .qty.value++;
                                                      },
                                                      icon: const Icon(
                                                          Icons.add))),
                                            ),
                                            Obx(
                                              () => Text(
                                                "${showCartController.qty.value}",
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                  color: Colors.deepOrange,
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Center(
                                                  child: IconButton(
                                                      onPressed: () async {
                                                        if (showCartController
                                                                .qty.value >
                                                            1) {
                                                          showCartController
                                                              .qty.value--;
                                                        } else {
                                                          Get.snackbar(
                                                              "Message",
                                                              "Minimum quantity should be 1");
                                                        }
                                                      },
                                                      icon: const Icon(
                                                          Icons.remove))),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },)
                      ],
                    ),
                  ),
      ),
    );
  }
}
