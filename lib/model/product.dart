// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';
import 'dart:ffi';

import 'package:onlineshop/model/rating.dart';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {

  int id;
  String title;
  Double price;
  String description;
  String category;
  String image;
  Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    description: json["description"],
    category: json["category"],
    image: json["image"],
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": category,
    "image":image,
    "rating":rating
  };
}
