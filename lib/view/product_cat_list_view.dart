// ALL PRODUCT CATEGORIES VIEW

import 'package:flutter/material.dart';
import 'package:onlineshop/view/product_list_view_from_cat.dart';
import '../data/fake_product_cat.dart';
import 'product_cat_item_view.dart';



class ProductCatListView extends StatelessWidget{
  const ProductCatListView({super.key});



  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          centerTitle: true,
          title: const Text("Product's Categories"),

        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
          // GridView(
          //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          //       maxCrossAxisExtent: 300,
          //       mainAxisExtent: 150,
          //       childAspectRatio: 2/1,
          //       crossAxisSpacing: 10,
          //       mainAxisSpacing: 10
          //   ),
          //   children: FAKE_PRODUCT_CAT.map(
          //           (e) => ProductCatItemView(category: e)
          //   ).toList()
          //   ,
          // ),

          GridView.builder(
            addAutomaticKeepAlives: true,
            itemCount: FAKE_PRODUCT_CAT.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200, // width

                  mainAxisExtent: 220, // height
                  childAspectRatio: 1,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5
              ),
            itemBuilder: (BuildContext context, int index) {
              return
                InkWell(
                    onTap: () {
                  //print("Tap to Category Item : $FAKE_PRODUCT_CAT[index].name with id : ${category.id}");
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProductListView(category: FAKE_PRODUCT_CAT[index]))
                  );
                },

                  child:
                  Scaffold(
                    body:
                    //Text(_title)
                    Card(
                      clipBehavior: Clip.antiAlias,
                      child:
                      Column(
                        children: [
                          FadeInImage.assetNetwork(
                            placeholder: 'assets/images/loading.gif',
                            image: FAKE_PRODUCT_CAT[index].url,
                            height: 170,
                            width: 200,
                            fit: BoxFit.cover,
                          )
                          // const Image(image: AssetImage('assets/images/sp.jpg'),
                          //   width: 300,
                          //   height: 200,
                          //   fit: BoxFit.cover,
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
                                  color: FAKE_PRODUCT_CAT[index].color,
                                  child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                      child: Text(FAKE_PRODUCT_CAT[index].name
                                        ,
                                        style: const TextStyle(
                                            fontFamily: "cc",
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white
                                        ),
                                      )
                                  )

                              ),
                            ),
                          )
                        ],
                      ),
                    )

                            //Image.network(FAKE_PRODUCT_CAT[index].url)

                  )
                );
            },
          ),

        ),

      ),
    );


  }

}