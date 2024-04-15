// SINGLE PRODUCT CATEGORY ITEM IN LIST VIEW

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/product_cat.dart';
import 'product_list_view_by_category.dart';



class ProductCatItemView extends StatelessWidget{

  ProductCat category;
  ProductCatItemView({super.key, required this.category});


  @override
  Widget build(BuildContext context) {
    String imageLink = category.url;
    String catName = category.name;
    print('Cat name : $catName with Link : $imageLink');
    //Image img = Image.network(imageLink);
    return
      InkWell(

        onTap: () {
          print("Tap to Category Item : ${category.name} with id : ${category.id}");
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ProductListViewByCat(category: category,))
          );
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

                  Image.network(imageLink,fit: BoxFit.cover,
                    height: 150,
                    width: 300,
                  )
                  ,
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
                        color: category.color.withOpacity(0.7),
                        child:
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(category.name,
                            style: const TextStyle(
                                fontFamily: "cc",
                                fontSize: 16,
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