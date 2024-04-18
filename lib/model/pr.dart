// To parse this JSON data, do
//
//     final prs = prsFromJson(jsonString);

import 'dart:convert';

Prs prsFromJson(String str) => Prs.fromJson(json.decode(str));

String prsToJson(Prs data) => json.encode(data.toJson());

class Prs {
  List<Pr> prs;
  int total;
  int skip;
  int limit;

  Prs({
    required this.prs,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory Prs.fromJson(Map<String, dynamic> json) => Prs(
    prs: List<Pr>.from(json["prs"].map((x) => Pr.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "prs": List<dynamic>.from(prs.map((x) => x.toJson())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };
}

class Pr {
  int id;
  String title;
  String description;
  int price;
  double discountPercentage;
  double rating;
  int stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;

  Pr({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory Pr.fromJson(Map<String, dynamic> json) => Pr(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
    discountPercentage: json["discountPercentage"]?.toDouble(),
    rating: json["rating"]?.toDouble(),
    stock: json["stock"],
    brand: json["brand"],
    category: json["category"],
    thumbnail: json["thumbnail"],
    images: List<String>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "price": price,
    "discountPercentage": discountPercentage,
    "rating": rating,
    "stock": stock,
    "brand": brand,
    "category": category,
    "thumbnail": thumbnail,
    "images": List<dynamic>.from(images.map((x) => x)),
  };
}
