import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/product.dart';
import '../model/raw_product.dart';

class NetworkRequest {
  static String productToJson(List<Product> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  static Future<List<Product>> fetchProduct(String urlProductFromCat) async {
    final response = await http
        .get(Uri.parse('https://dummyjson.com/products/category/smartphones'));

    if (response.statusCode == 200) {
      //print(response.body);
      final rawProduct data = rawProduct.fromJson(response.body);
      final listProductData = data.products;
      final List<Product> listProduct = listProductData
          .map((e) => Product(
          id: e['id'] as int,
          title: e['title'] as String,
          description: e['description'] as String,
          price: e['price'] as int,
          discountPercentage: e['discountPercentage'] as double,
          rating: e['rating'] as double,
          stock: e['stock'] as int,
          brand: e['brand'] as String,
          category: e['category'] as String,
          thumbnail: e['thumbnail'] as String,
          images: e['images']?.cast<String>()))
          .toList();
      print(listProduct);
      return listProduct;
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Cannot get data');
    }
  }
}
