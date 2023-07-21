import 'package:flutter/material.dart';

import '../model/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.image!,
              height: 300,
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 250,
              child: Text(
                product.title!,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  Text(
                    '\$${product.price!}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    product.description!,
                    style: const TextStyle(fontSize: 25),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
