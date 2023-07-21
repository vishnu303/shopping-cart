import 'package:cart_app/model/product.dart';
import 'package:http/http.dart' as http;

class ProductRepo {
  Future<List<Product>> fetchData() async {
    try {
      http.Response response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      return productFromMap(response.body.toString());
    } catch (e) {
      rethrow;
    }
  }
}
