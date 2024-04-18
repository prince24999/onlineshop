// SINGLE PRODUCT ITEM VIEW IN LIST

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:onlineshop/model/comment.dart';
import 'package:onlineshop/view/product_detail_view.dart';

class CommentItemView extends StatelessWidget {

  Comment comment;
  Color titleColor;

  CommentItemView({super.key, required this.comment, required this.titleColor});


  @override
  Widget build(BuildContext context) {

    //String _imageLink = product.body;
    String _title = comment.name;
    String _des = comment.body;

    return

      InkWell(
        onTap: () => {

          // Navigator.of(context).push(
          //     MaterialPageRoute(builder: (context) => ProductDetailView(comment,titleColor)))
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
                  // FadeInImage.assetNetwork(
                  //   placeholder: 'assets/images/loading.gif',
                  //   image: _imageLink,
                  //   height: 150,
                  //   width: 300,
                  //   fit: BoxFit.cover,
                  // ),
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