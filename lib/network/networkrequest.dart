import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:onlineshop/model/rating.dart';
import '../model/product.dart';
import '../model/raw_product.dart';

class NetworkRequest {
  static const String baseProductOfCat = 'https://fakestoreapi.com/products/category/';

  static String productToJson(List<Product> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  static Future<List<Product>> fetchProduct(String catname) async {
    final response = await http
        .get(Uri.parse(baseProductOfCat + catname));

    if (response.statusCode == 200) {
      //print(response.body);
      final rawProduct data = rawProduct.fromJson(response.body);
      final listProductData = data.products;
      final List<Product> listProduct = listProductData
          .map((e) => Product(
          id: e['id'] as int,
          title: e['title'] as String,
          price: e['price'] as Double,
          description: e['description'] as String,
          category: e['category'] as String,
          image: e['image'] as String,
          rating: e['rating'] as Rating

          ))
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
