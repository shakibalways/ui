



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splash_login_sign_up_ui/controller/getx/product_discription.dart';

import 'package:splash_login_sign_up_ui/model/product.dart';

class ProductDescriptionPage extends StatelessWidget {
  final Products productData;
  final int id;
  const ProductDescriptionPage({
    super.key,
    required this.productData,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final ProductDescriptionController productDescriptionController =
        Get.put(ProductDescriptionController());
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Product Details",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          backgroundColor: Colors.pink,
          centerTitle: true,
        ),
        body: Obx(
          () => productDescriptionController.isLoading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Images:',
                        style: TextStyle(fontSize: 22),
                      ),
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: productDescriptionController.image.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(

                                "${"ApiUrl.baseIP"}/${productDescriptionController.image[index]}",
                                height: 300,
                                fit: BoxFit.fitHeight,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${productData.nameEn}",
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  for (int i = 0; i < 5; i++)
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                      "(0/${productDescriptionController.productDetails?.rating ?? 0})"),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                      "(${productDescriptionController.productDetails?.review ?? 0} Review)"),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Stock:",
                                    style: TextStyle(color: Colors.deepOrange),
                                  ),
                                  Text(
                                      '${productDescriptionController.productDetails?.productStock ?? 0}'),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "${double.parse(productData.regPrice.toString())} ৳",
                                style: const TextStyle(
                                    color: Colors.deepOrangeAccent,
                                    fontSize: 18),
                              ),
                              Text("${productData.disPrice ?? ""}")
                            ],
                          )
                        ],
                      ),
                      const Text(
                        "Discription:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      Text(
                          "${productDescriptionController.productDetails?.description?.en ?? ""}"),
                      const Spacer(),
                      GestureDetector(
                        onTap: ()async{
                      await productDescriptionController.addToCartFun(id: id);
                      Get.back();

                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(
                            child: Text(
                              "Add To Cart",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
        ));
  }
}
