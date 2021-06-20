import 'package:flutter/material.dart';
import 'package:shopping_cart/api/api.dart';

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
      _widgets.add(Text(data["title"]));
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
      children: _items,
    );
  }
}
