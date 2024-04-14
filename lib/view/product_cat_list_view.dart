// ALL PRODUCT CATEGORIES VIEW

import 'package:flutter/material.dart';
import '../data/fake_product_cat.dart';
import 'product_cat_item_view.dart';


class ProductCatListView extends StatelessWidget{
  const ProductCatListView({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.blue.withOpacity(0.7),
          foregroundColor: Colors.white,
          centerTitle: true,
          title: Text("Product's Categories"),

        ),
        body: Padding(


          padding: const EdgeInsets.all(8.0),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                mainAxisExtent: 150,
                childAspectRatio: 2/1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10
            ),
            children: FAKE_PRODUCT_CAT.map(
                    (e) => ProductCatItemView(category: e)
            ).toList()
            ,
          ),
        ),

      ),
    );


  }

}