import 'package:cart_app/controller/product_controller.dart';
import 'package:cart_app/model/product.dart';
import 'package:cart_app/screen/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductList extends StatelessWidget {
  final List<Product> product;
  const ProductList({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var sWidth = MediaQuery.of(context).size.width;

    ProductController productController = Get.find();
    return Obx(
      () => ListView.builder(
          itemCount: product.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailsScreen(product: product[index])));
              },
              child: Card(
                child: SizedBox(
                  height: 120,
                  width: sWidth,
                  child: Row(
                    children: [
                      Image.network(
                        product[index].image!,
                        height: 120,
                        width: 100,
                        fit: BoxFit.fitWidth,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 180,
                            child: Text(
                              product[index].title!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('\$${product[index].price} '),
                        ],
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                productController.increase(index);
                              },
                              child: const Text('+')),
                          Text(productController.productList[index].numberProd
                              .toString()),
                          ElevatedButton(
                              onPressed: () =>
                                  productController.decrease(index),
                              child: const Text('-'))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
