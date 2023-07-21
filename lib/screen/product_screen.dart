import 'package:cart_app/controller/product_controller.dart';
import 'package:cart_app/screen/cart_screen.dart';
import 'package:cart_app/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  final ProductController _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App'),
      ),
      body: ProductList(
        product: _productController.productList,
      ),
      floatingActionButton: FloatingActionButton(
          child: Badge(
            child: const Icon(Icons.shopping_cart),
            label: Obx(() => Text(_productController.itemCount.toString())),
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => CartScreen()));
            _productController.cartItems();
          }),
    );
  }
}
