// PRODUCTS LIST VIEW BY CATEGORY

import 'package:flutter/material.dart';
import 'package:onlineshop/model/product.dart';
import '../data/fake_product.dart';
import '../model/product_cat.dart';
import 'product_item_view.dart';



// Danh sach cac Product cua Category

class ProductListViewByCat extends StatelessWidget {
  final ProductCat category;

  const ProductListViewByCat({super.key, required this.category});



  @override
  Widget build(BuildContext context) {
    String imageLink = category.url;
    print(imageLink);

    List<Product> filterProducts = FAKE_PRODUCTS.where((product) =>
    product.catid == category.id).toList();


    return Scaffold(
        appBar: AppBar(
          backgroundColor: category.color.withOpacity(0.7),
          foregroundColor: Colors.white,
          centerTitle: true,
          title: Text(category.name),
        ),
        body:
        Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            Text('Products of Cat id : $category.id')


            // GridView(
            //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            //         maxCrossAxisExtent: 300, // max item width
            //         mainAxisExtent: 150, // max item height
            //         childAspectRatio: 1 / 1,
            //         crossAxisSpacing: 10,
            //         mainAxisSpacing: 10
            //     ),
            //     children:
            //     filterProducts.map((e) => ProductItemView(product: e, titleColor: category.color,)).toList()
            //
            //
            // )
        )
    );

  }
}