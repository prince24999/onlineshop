// SINGLE PRODUCT ITEM VIEW IN LIST

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlineshop/view/product_detail_view.dart';

import '../model/product.dart';

class ProductItemView extends StatelessWidget {

  Product product;
  Color titleColor;

  ProductItemView({super.key, required this.product, required this.titleColor});


  @override
  Widget build(BuildContext context) {

    String _imageLink = product.thumbnail;
    String _title = product.title;
    String _des = product.description;

    return

      InkWell(
        onTap: () => {

          Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ProductDetailView(product,titleColor)))
        },
        child:
        Scaffold(
        body:
        //Text(_title)

          Card(
            clipBehavior: Clip.antiAlias,
            child:

            Stack(
              children: [
                Image.network(_imageLink,fit: BoxFit.cover,
                  height: 150,
                  width: 300,
                ),
                Padding(
                  padding:
                  //const EdgeInsets.only(top: 50,left: 0,right: 0,bottom: 0),
                  const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                  child:
                  Container(
                    alignment: Alignment.center,

                    width: 300,
                    height: 45,
                    color: titleColor.withOpacity(0.7),
                    child:
                    Text(_title,
                      style: const TextStyle(
                          fontFamily: "cc",
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.white
                      ),
                    ),
                  ),
                )
              ]
            ),

          ),
        ),
      );

  }

}