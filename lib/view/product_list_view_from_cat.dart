import 'package:flutter/material.dart';
import 'package:onlineshop/network/networkrequest.dart';
import 'package:onlineshop/view/product_item_view.dart';
import '../model/product.dart';
import '../model/product_cat.dart';


class ProductListView extends StatefulWidget {
  final ProductCat category;


  const ProductListView({super.key, required this.category});

  @override
  ProductListViewState createState() => ProductListViewState(cat: category);

}

class ProductListViewState extends State<ProductListView>{

  late List<Product> products;
  bool isLoading = true;
  ProductCat cat;


  ProductListViewState({required this.cat});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    NetworkRequest.fetchProduct(cat.name).then((datafromserver) =>
    {
      setState(() {
        products = datafromserver;
        // print('///////////////////////////////////////////////////////////////////////////');
        // print(products);
        if(products.isEmpty) {
          isLoading = true;
        } else {
          isLoading = false;
        }
      })
    });
  }

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
          backgroundColor: cat.color,
          foregroundColor: Colors.white,
          centerTitle: true,
          title: Text(cat.name),
        ),
        body:
        AlertDialog(
            content: Row(children: [
              const CircularProgressIndicator(
              backgroundColor: Colors.red,
            ),
            Container(margin: const EdgeInsets.only(left: 7), child: const Text("Loading...")),
          ]),
          )
        );

  }

  Scaffold drawLayout()
  {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: cat.color,
          foregroundColor: Colors.white,
          centerTitle: true,
          title: Text(cat.name),
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