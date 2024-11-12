// SINGLE PRODUCT CATEGORY ITEM IN LIST VIEW

import 'package:flutter/material.dart';
import 'package:onlineshop/view/product_list_view_from_cat.dart';
import '../model/product_cat.dart';




class ProductCatItemView extends StatelessWidget{

  ProductCat category;
  ProductCatItemView({super.key, required this.category});


  @override
  Widget build(BuildContext context) {
    String imageLink = category.url;
    String catName = category.name;
    catName = catName.replaceFirst(catName[0], catName[0].toUpperCase());

    print('Cat name : $catName with Link : $imageLink');
    //Image img = Image.network(imageLink);
    return
      // InkWell(
      //
      //   onTap: () {
      //     print("Tap to Category Item : $catName with id : ${category.id}");
      //     Navigator.of(context).push(
      //         MaterialPageRoute(builder: (context) => ProductListView(category: category))
      //     );
      //   },
      //   child:

        // Scaffold(
        //   body:
          //Text(_title)

          Card(
            clipBehavior: Clip.antiAlias,
            child:

            Stack(
                children: [

                  FadeInImage.assetNetwork(
                    placeholder: 'assets/images/loading.gif',
                    image: imageLink,
                    height: 170,
                    width: 200,
                    fit: BoxFit.cover,
                  )


                  // Image.network(imageLink,fit: BoxFit.cover,
                  //   height: 150,
                  //   width: 300,
                  // )
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

                        width: 200,
                        height: 42,
                        color: category.color.withOpacity(0.7),
                        child:
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(catName,
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

          );
        //);

    //  );
  }

}