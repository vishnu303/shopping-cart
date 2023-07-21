import 'package:cart_app/controller/product_controller.dart';

import 'package:cart_app/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(child: ProductList(product: controller.cartList)),
          SizedBox(
            height: 70,
            child: Column(
              children: [
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Obx(
                    () {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Total",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                '\$${controller.totalPrice.value.toString()}',
                              )
                            ],
                          ),
                          ElevatedButton(
                              onPressed: () {}, child: const Text("Check out"))
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
