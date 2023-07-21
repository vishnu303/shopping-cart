import 'package:cart_app/model/product.dart';
import 'package:cart_app/repository/product_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList<Product> productList = <Product>[].obs;
  RxList<Product> cartList = <Product>[].obs;
  RxInt itemCount = 0.obs;
  RxDouble totalPrice = 0.0.obs;
  @override
  void onInit() {
    getData();
    super.onInit();
  }

//get data
  void getData() async {
    try {
      productList.value = await ProductRepo().fetchData();

      // print(productList[0].category);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

//count number of item
  countAllItems() {
    itemCount.value = 0;
    for (var item in productList) {
      itemCount.value += item.numberProd;
    }
  }

//calculate total price
  calculatePrice() {
    totalPrice.value = 0.0;
    for (var item in productList) {
      if (item.numberProd > 0) {
        totalPrice.value = (item.price! * item.numberProd) + totalPrice.value;
      }
    }
  }

//increase the number of item
  void increase(int index) {
    productList[index].numberProd++;
    productList.refresh();
    countAllItems();
    calculatePrice();
    debugPrint(productList[index].numberProd.toString());
  }

//decrease the number of item
  void decrease(int index) {
    if (productList[index].numberProd > 0) {
      productList[index].numberProd--;
      productList.refresh();
      countAllItems();
      calculatePrice();
    }
  }

  void cartItems() {
    cartList.clear();
    for (var item in productList) {
      if (item.numberProd > 0) {
        cartList.add(item);
      }
    }
  }
}
