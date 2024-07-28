// SINGLE PRODUCT DETAIL VIEW

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import '../model/product.dart';




class ProductDetailView extends StatefulWidget {
  final Product p;
  final Color titleColor;

  const ProductDetailView(this.p, this.titleColor, {super.key});
  @override
  _ProductDetailViewState createState() {
    return _ProductDetailViewState(pr: p, c: titleColor);
  }
}

class _ProductDetailViewState extends State<ProductDetailView> {
  Product pr;
  Color c;
  //List<String> lProductImages = pr.images;
  _ProductDetailViewState({required this.pr, required this.c});

  @override
  void initState(){
    super.initState();
    // you can use this.widget.foo here

    // print(dmcc);
    //
    //
    // for(int i = 0; i < dmcc.length; i++)
    // {
    //   ProductImage img = ProductImage(dmcc[i]);
    //   lProductImages.add(img);
    // }
    //print(lProductImages);
  }



  // final List<List<String>> products = [
  //   [
  //     'assets/images/watch-1.jpg',
  //     'Hugo Boss Oxygen',
  //     '100 \$'
  //   ],
  //   [
  //     'assets/images/watch-2.jpg',
  //     'Hugo Boss Signature',
  //     '120 \$'
  //   ],
  //   [
  //     'assets/images/watch-3.jpg',
  //     'Casio G-Shock Premium',
  //     '80 \$'
  //   ]
  // ];

  int currentIndex = 0;



  void _next() {
    setState(() {
      if (currentIndex < pr.images.length -1) {
        currentIndex++;
      } else {
        currentIndex = currentIndex;
      }
    });
  }

  void _preve() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      } else {
        currentIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        backgroundColor: c.withOpacity(0.7),
        foregroundColor: Colors.white,
        centerTitle: true,

      ),
      body:
      Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            GestureDetector(
              onHorizontalDragEnd: (DragEndDetails details) {
                if (details.velocity.pixelsPerSecond.dx > 0) {
                  _preve();
                } else if (details.velocity.pixelsPerSecond.dx < 0) {
                  _next();
                }
              },
              child: FadeInUp(
                  duration: const Duration(milliseconds: 500),
                  child:
                  Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                          //AssetImage(products[currentIndex][0]),
                          NetworkImage(pr.images[currentIndex]),
                          fit: BoxFit.contain
                      )
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            colors: [
                              Colors.grey.shade700.withOpacity(.9),
                              Colors.grey.withOpacity(.0),
                            ]
                        )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FadeInUp(duration: const Duration(milliseconds: 500), child: Container(
                          width: 90,
                          margin: const EdgeInsets.only(bottom: 50),
                          child: Row(
                            children: _buildIndicator(),
                          ),
                        ))
                      ],
                    ),
                  ),
              )),
            ),
            Expanded(
              child: Transform.translate(
                offset: const Offset(0, -25),
                child: FadeInUp(duration: const Duration(milliseconds: 500), // All content
                    child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 25,right: 25,top: 0,bottom: 0),
                    decoration:
                    const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))
                      ),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: [
                            const SizedBox(height: 20),
                            FadeInUp(duration: const Duration(milliseconds: 800), // Product Name
                                child: Text(pr.title,
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),)),
                            const SizedBox(height: 15,),

                            Row(
                              children: <Widget>[
                                FadeInUp(duration: const Duration(milliseconds: 800), // Rating Text
                                    child: Text('100', style: TextStyle(
                                        color: Colors.yellow[700],
                                        fontWeight: FontWeight.bold, fontSize: 20),)),
                                const SizedBox(width: 10,),
                                FadeInUp(duration: const Duration(milliseconds: 800), // Rating Star
                                    child: Row(
                                    children: <Widget>[
                                      Icon(Icons.star, size: 18, color: Colors.yellow[700],),
                                      Icon(Icons.star, size: 18, color: Colors.yellow[700],),
                                      Icon(Icons.star, size: 18, color: Colors.yellow[700],),
                                      Icon(Icons.star, size: 18, color: Colors.yellow[700],),
                                      Icon(Icons.star_half, size: 18, color: Colors.yellow[700],),
                                      const SizedBox(width: 5,),
                                      const Text("(4.2/70 reviews)",
                                      style: TextStyle(color: Colors.grey, fontSize: 12),)
                                  ],
                                ))
                              ],
                            ),
                            const SizedBox(height: 20),
                            FadeInUp(
                              duration: const Duration(milliseconds: 800),
                              child:
                              //Html(data:"<p>Hello <b>Flutter</b><p>"),
                              Text(pr.description)
                                //HtmlWidget(pr.description)

                            )
                          ],
                        ),

                        FadeInUp(
                            duration: const Duration(milliseconds: 800),
                            child: MaterialButton(
                            onPressed: () {},
                            height: 45,
                            color: Colors.yellow[700],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                              child: const Center(
                                child: Text("ADD TO CART", style: TextStyle(
                                    fontWeight: FontWeight.bold),),
                              ),
                          )
                        ),
                    ],
                  ),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return Expanded(
      child: Container(
        height: 4,
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: isActive ? Colors.grey[800] : Colors.white
        ),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for(int i = 0; i < pr.images.length; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}

// class ProductDetailView extends StatelessWidget{
//
//   Product product;
//   Color titleColor;
//
//   ProductDetailView({super.key, required this.product, required this.titleColor});
//   //final controller = PageController(viewportFraction: 0.8, keepPage: true);
//
//
//   @override
//   Widget build(BuildContext context) {
//     List<String> dmcc = product.images;
//     print(dmcc);
//     List<ProductImage> lProductImages = [];
//
//     for(int i = 0; i < dmcc.length; i++)
//       {
//         ProductImage img = ProductImage(dmcc[i]);
//         lProductImages.add(img);
//       }
//     print(lProductImages.length);
//
//     // List<Widget> pages = product.images.map((e) => ProductImage(e)) as List<Widget>;
//     // print(pages);
//
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: titleColor.withOpacity(0.7),
//           foregroundColor: Colors.white,
//           centerTitle: true,
//           title: Text(product.title),
//         ),
//         body:
//         //Text('sdfsd')
//
//         const SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>
//               [
//
//                 SizedBox(
//
//                   height: 240,
//                   child:
//                   Text('Slide show')
//                 ),
//                 SizedBox(height: 15),
//                 Padding(
//                   padding: EdgeInsets.only(top: 15, bottom: 15,left: 15, right: 15),
//                   child: Text("This is Product's Informations"),
//                 ),
//
//               ]   // const SizedBox(height: 32.0),
//             )
//           )
//         )
//     );
//
//   }
//
// }