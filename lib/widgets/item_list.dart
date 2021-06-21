import 'package:flutter/material.dart';
import 'package:shopping_cart/api/api.dart';
import 'package:shopping_cart/widgets/search_bar.dart';

import 'item_card.dart';

class ItemList extends StatefulWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  List<Widget> _items = [];

  void getData() async {
    var res = await fetchData();
    List<Widget> _widgets = [];
    res.forEach((data) {
      _widgets.add(ItemCard(data: data));
    });
    setState(() {
      _items = _widgets;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBar(),
        ..._items,
      ],
    );
  }
}
