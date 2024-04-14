import 'package:flutter/cupertino.dart';

class ProductImage extends StatelessWidget{
  String url;

  ProductImage(this.url);

  @override
  Widget build(BuildContext context) {
    return Image.network(url);
  }

}