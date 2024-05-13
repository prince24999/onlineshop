import 'package:flutter/material.dart';
import '../model/product_cat.dart';

List<ProductCat> FAKE_PRODUCT_CAT = [
  ProductCat(color: Colors.black,id: 1, name: "smartphones", url: "https://businesstech.co.za/news/wp-content/uploads/2013/02/Smartphone-Featurephone.jpg"),
  ProductCat(color: Colors.blueGrey,id: 2, name: "laptops", url: "https://media.product.which.co.uk/prod/images/pr_4to3_400x300/22a475e555d7-best-laptop-deals.jpg"),
  ProductCat(color: Colors.pinkAccent,id: 3, name: "fragrances", url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkDVBQBrpaaiyDKeh9x-2fqNQONyYnYvQj1I73oViOFA&s"),
  ProductCat(color: Colors.cyan,id: 4, name: "skincare", url: "https://static.toiimg.com/thumb/msid-103956675,width-400,resizemode-4/103956675.jpg"),
  ProductCat(color: Colors.green,id: 5, name: "groceries", url: "https://static.toiimg.com/thumb/msid-69307958,width-400,resizemode-4/69307958.jpg"),
  ProductCat(color: Colors.brown,id: 6, name: "home-decoration", url: "https://cdn.dribbble.com/userupload/12919276/file/original-115560f11388deb0f104b2c22f5b3927.png?resize=400x0"),
  ProductCat(color: Colors.blue,id: 7, name: "furniture", url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTh03HJD6DUfc_TJlS13RjDd5NOl43uLbSXOJcLeW5loA&s"),
  ProductCat(color: Colors.green,id: 8, name: "tops", url: "https://cdn.dribbble.com/users/44134/screenshots/1652216/media/20d388cff640dce1d8bd6d347209b9f6.jpg?resize=400x0"),
  ProductCat(color: Colors.deepPurpleAccent,id: 9, name: "womens-dresses", url: "https://static.toiimg.com/thumb/msid-71096160,width-400,resizemode-4/71096160.jpg"),
  ProductCat(color: Colors.amberAccent,id: 10, name: "womens-shoes", url: "https://static.toiimg.com/thumb/73168713.cms?width=400&height=300&resizemode=4&imgsize=1384929"),
  ProductCat(color: Colors.red,id: 11, name: "mens-shirts", url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_tzPLf9E8hsduAelE7O0ReLrX1aKT8pyXAI23NppduQ&s"),
  ProductCat(color: Colors.indigoAccent,id: 12, name: "mens-shoes", url: "https://mayorssports.com/cdn/shop/products/goor_brogue_tan_box.jpg?v=1576879989"),
  ProductCat(color: Colors.deepPurple,id: 13, name: "mens-watches", url: "https://static.toiimg.com/thumb/msid-81671027,width-400,resizemode-4/81671027.jpg"),
  ProductCat(color: Colors.orange,id: 14, name: "womens-watches", url: "https://i.pinimg.com/474x/af/81/9d/af819de06f6cd919b8f463e664f2b542.jpg"),
  ProductCat(color: Colors.pink,id: 15, name: "womens-bags", url: "https://m.media-amazon.com/images/I/61hGMu2+2WL._AC_UY300_.jpg"),
  ProductCat(color: Colors.deepPurpleAccent,id: 16, name: "womens-jewellery", url: "https://static.toiimg.com/thumb/msid-68993072,width-400,resizemode-4/68993072.jpg"),
  ProductCat(color: Colors.lightBlue,id: 17, name: "sunglasses", url: "https://dollger.com/cdn/shop/articles/IMG_202311085859_400x300_90acc99a-a159-440a-b9f1-7189e5f7ad86.jpg?v=1699408878&width=2048"),
  ProductCat(color: Colors.grey,id: 18, name: "automotive", url: "https://dm.henkel-dam.com/is/image/henkel/closeup-white-concept-car-interior-future-design"),
  ProductCat(color: Colors.black,id: 19, name: "motorcycle", url: "https://www.whateverwheels.co.uk/smsimg/173/13308-21205-list-smartselect_20180731-002634_photos-173.jpg"),
  ProductCat(color: Colors.brown,id: 20, name: "lighting", url: "https://d26zy8eawpuu2c.cloudfront.net/wp-content/uploads/2014/07/After_1.gif")
];

Future<List<ProductCat>> getCatsFromServer({required int page, required int limit}) async {
  if (limit <= 0) return [];
  return FAKE_PRODUCT_CAT.skip((page - 1) * limit).take(limit).toList();
}