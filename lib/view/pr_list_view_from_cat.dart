import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:onlineshop/network/networkrequest.dart';
import 'package:onlineshop/view/product_item_view.dart';
import '../model/product.dart';
import '../model/product_cat.dart';


class PrListView extends StatefulWidget {
  final ProductCat category;


  const PrListView({super.key, required this.category});

  @override
  PrListViewState createState() => PrListViewState();

}

class PrListViewState extends State<PrListView>{

  late List<Product> products;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    NetworkRequest.fetchProduct("").then((datafromserver) =>
    {
      setState(() {
        products = datafromserver;
        print('///////////////////////////////////////////////////////////////////////////');
        print(products);
        if(products.isEmpty) {
          isLoading = true;
        } else {
          isLoading = false;
        }
      })
    });
  }


  // @override
  // Widget build(BuildContext context) {
  //   final prs = NetworkRequest.fetchProduct('');
  //   return FutureBuilder(
  //       future: prs,
  //       builder: (ctx, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.done) {
  //           final ps = prs as List<Product>;
  //             return Scaffold(
  //                 appBar: AppBar(
  //                   backgroundColor: Colors.blue.withOpacity(0.7),
  //                   foregroundColor: Colors.white,
  //                   centerTitle: true,
  //                   title: Text('a'),
  //                 ),
  //                 body:
  //                 Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child:
  //                     //Text('ccc')
  //                     GridView(
  //                         gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
  //                             maxCrossAxisExtent: 300, // max item width
  //                             mainAxisExtent: 150, // max item height
  //                             childAspectRatio: 1 / 1,
  //                             crossAxisSpacing: 10,
  //                             mainAxisSpacing: 10
  //                         ),
  //                         children:
  //                         ps.map((e) => ProductItemView(product: e, titleColor: Colors.blue,)).toList()
  //                     )
  //                 )
  //             );
  //         }
  //         else {
  //           return const CircularProgressIndicator();
  //         }
  //       }
  //   );
  // }



  @override
  Widget build(BuildContext context) {
    if(isLoading == true) {
      return drawLoading();
    } else {
      return drawLayout();
    }
  }

  Scaffold drawLoading()
  {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.withOpacity(0.7),
          foregroundColor: Colors.white,
          centerTitle: true,
          title: Text(''),
        ),
        body:
        AlertDialog(
            content: Row(children: [
              CircularProgressIndicator(
              backgroundColor: Colors.red,
            ),
            Container(margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
          ]),
          )
        );

  }

  Scaffold drawLayout()
  {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.withOpacity(0.7),
          foregroundColor: Colors.white,
          centerTitle: true,
          title: Text('category.name'),
        ),
        body:
        Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            //Text('ccc')


            GridView(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300, // max item width
                    mainAxisExtent: 150, // max item height
                    childAspectRatio: 1 / 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10
                ),
                children:
                products.map((e) => ProductItemView(product: e, titleColor: Colors.blue,)).toList()


            )



        )
    );
  }
}