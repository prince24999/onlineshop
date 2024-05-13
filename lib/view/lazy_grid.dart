import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlineshop/model/product_cat.dart';
import 'package:onlineshop/view/product_cat_item_view.dart';

import '../data/fake_product_cat.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const double _endReachedThreshold = 200;
  static const int _itemsPerPage = 20;

  final ScrollController _controller = ScrollController();

  List<ProductCat> _cats = [];
  int _nextPage = 1;
  bool _loading = true;
  bool _canLoadMore = true;

  @override
  void initState() {
    _controller.addListener(_onScroll);

    _getCats();

    super.initState();
  }

  Future<void> _getCats() async {
    _loading = true;

    final newCats = await getCatsFromServer(page: _nextPage, limit: _itemsPerPage);

    setState(() {
      _cats.addAll(newCats);

      _nextPage++;

      if (newCats.length < _itemsPerPage) {
        _canLoadMore = false;
      }

      _loading = false;
    });
  }

  void _onScroll() {
    if (!_controller.hasClients || _loading) return;

    final thresholdReached = _controller.position.extentAfter < _endReachedThreshold;

    if (thresholdReached) {
      _getCats();
    }
  }

  Future<void> _refresh() async {
    _canLoadMore = true;
    _cats.clear();
    _nextPage = 1;
    await _getCats();
  }

  Widget _buildCatItem(BuildContext context, int index) {
    return ProductCatItemView(category: _cats[index]);
  }

  @override
  Widget build(BuildContext context) {
    return 
      MaterialApp(
        home: Scaffold(
        appBar: AppBar(
          title: const Text('Colors'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        body: 
        CustomScrollView(
          controller: _controller,
          slivers: <Widget>[
            CupertinoSliverRefreshControl(
              onRefresh: _refresh,
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200, // width
                    mainAxisExtent: 220, // height
                    childAspectRatio: 1,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5
                ),
                delegate: SliverChildBuilderDelegate(
                  _buildCatItem,
                  childCount: _cats.length,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: _canLoadMore
                  ? Container(
                padding: const EdgeInsets.only(bottom: 16),
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              )
                  : const SizedBox(),
            ),
          ],
        ),
            ),
      );
  }
}