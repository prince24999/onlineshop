import 'dart:convert';

class rawProduct {
  List<dynamic> products;
  int total;
  int skip;
  int limit;

  rawProduct(
      {required this.products,
      required this.total,
      required this.skip,
      required this.limit});

  factory rawProduct.fromJson(dynamic json) {
    var response = jsonDecode(json);
    List<dynamic> listProduct = response['products'];
    int t = response['total'];
    int s = response['skip'];
    int l = response['limit'];
    //print(a);
    return rawProduct(products: listProduct, total: t, skip: s, limit: l);
  }

}
