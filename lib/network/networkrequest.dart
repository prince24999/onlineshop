import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:onlineshop/model/rating.dart';
import '../model/product.dart';
import '../model/raw_product.dart';

class NetworkRequest {
  static const String baseProductOfCat = 'https://fakestoreapi.com/products/category/';
  //["electronics","jewelery","men's clothing","women's clothing"]
  // static String productToJson(List<product> data) =>
  //     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  static Future<List<Product>> fetchProduct(String catname) async {
    String url = baseProductOfCat + catname;
    final response = await http.get(Uri.parse(url));


    if (response.statusCode == 200) {

      final List<dynamic> jsonResponse = json.decode(response.body);


      final List<Product> listProduct = jsonResponse.map((json) => Product.fromJson(json)).toList();

      //print(listProduct);
      return listProduct;
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Cannot get data');
    }
  }
}
