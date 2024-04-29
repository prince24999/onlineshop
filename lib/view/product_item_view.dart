// SINGLE PRODUCT ITEM VIEW IN LIST

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                FadeInImage.assetNetwork(
                  placeholder: 'assets/images/loading.gif',
                  image: _imageLink,
                  height: 150,
                  width: 300,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding:
                    //const EdgeInsets.only(top: 50,left: 0,right: 0,bottom: 0),
                    const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child:
                    Container(
                      alignment: Alignment.centerLeft,

                      width: 300,
                      height: 45,
                      color: titleColor.withOpacity(0.7),
                      child:
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                        child: Text(_title,
                          style: const TextStyle(
                              fontFamily: "cc",
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.white
                          ),
                        ),
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