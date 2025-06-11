import 'package:flutter/material.dart';
import '../model/product_cat.dart';

List<ProductCat> FAKE_PRODUCT_CAT = [
  ProductCat(color: Colors.black,id: 1, name: "electronics", url: "https://eg.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/54/087272/1.jpg?2210"),
  ProductCat(color: Colors.blueGrey,id: 2, name: "jewelery", url: "https://salt.tikicdn.com/cache/w300/ts/product/43/ce/02/1e88ff9ef9cf98dd66c43e878e93032b.jpg"),
  ProductCat(color: Colors.pinkAccent,id: 3, name: "men's clothing", url: "https://www.evogennutrition.com/cdn/shop/collections/faa4aadb49d7628085ba5ede2ef28e3f_300x.jpg?v=1712767414"),
  ProductCat(color: Colors.cyan,id: 4, name: "women's clothing", url: "https://www.next.us/nxtcms/resource/blob/5791260/cd420f173eddbabfa099d8dd661cc7b0/occasion-data.jpg"),
  ProductCat(color: Colors.black,id: 5, name: "electronics", url: "https://eg.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/54/087272/1.jpg?2210"),
  ProductCat(color: Colors.blueGrey,id: 6, name: "jewelery", url: "https://salt.tikicdn.com/cache/w300/ts/product/43/ce/02/1e88ff9ef9cf98dd66c43e878e93032b.jpg"),
  ProductCat(color: Colors.pinkAccent,id: 7, name: "men's clothing", url: "https://www.evogennutrition.com/cdn/shop/collections/faa4aadb49d7628085ba5ede2ef28e3f_300x.jpg?v=1712767414"),
  ProductCat(color: Colors.cyan,id: 8, name: "women's clothing", url: "https://www.next.us/nxtcms/resource/blob/5791260/cd420f173eddbabfa099d8dd661cc7b0/occasion-data.jpg"),
  ProductCat(color: Colors.black,id: 9, name: "electronics", url: "https://eg.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/54/087272/1.jpg?2210"),
  ProductCat(color: Colors.blueGrey,id: 10, name: "jewelery", url: "https://salt.tikicdn.com/cache/w300/ts/product/43/ce/02/1e88ff9ef9cf98dd66c43e878e93032b.jpg"),
  ProductCat(color: Colors.pinkAccent,id: 11, name: "men's clothing", url: "https://www.evogennutrition.com/cdn/shop/collections/faa4aadb49d7628085ba5ede2ef28e3f_300x.jpg?v=1712767414"),
  ProductCat(color: Colors.cyan,id: 12, name: "women's clothing", url: "https://www.next.us/nxtcms/resource/blob/5791260/cd420f173eddbabfa099d8dd661cc7b0/occasion-data.jpg"),
  ProductCat(color: Colors.black,id: 13, name: "electronics", url: "https://eg.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/54/087272/1.jpg?2210"),
  ProductCat(color: Colors.blueGrey,id: 14, name: "jewelery", url: "https://salt.tikicdn.com/cache/w300/ts/product/43/ce/02/1e88ff9ef9cf98dd66c43e878e93032b.jpg"),
  ProductCat(color: Colors.pinkAccent,id: 15, name: "men's clothing", url: "https://www.evogennutrition.com/cdn/shop/collections/faa4aadb49d7628085ba5ede2ef28e3f_300x.jpg?v=1712767414"),
  ProductCat(color: Colors.cyan,id: 16, name: "women's clothing", url: "https://www.next.us/nxtcms/resource/blob/5791260/cd420f173eddbabfa099d8dd661cc7b0/occasion-data.jpg"),

];

Future<List<ProductCat>> getCatsFromServer({required int page, required int limit}) async {
  if (limit <= 0) return [];
  return FAKE_PRODUCT_CAT.skip((page - 1) * limit).take(limit).toList();
}