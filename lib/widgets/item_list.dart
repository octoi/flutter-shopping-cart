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
  List _data = [];

  void displayData(List data) {
    List<Widget> _widgets = [];
    data.forEach((data) {
      _widgets.add(ItemCard(data: data));
    });
    setState(() {
      _items = _widgets;
    });
  }

  void getData() async {
    var res = await fetchData();
    displayData(res);
    setState(() {
      _data = res;
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
        SearchBar(
          onChange: (String searchQuery) {
            searchQuery = searchQuery.toLowerCase();
            if (searchQuery == '') {
              displayData(_data);
            } else {
              List filteredData = _data.where((item) {
                String title = item['title'].toLowerCase();
                return title.contains(searchQuery);
              }).toList();
              displayData(filteredData);
            }
          },
          data: _data,
        ),
        SizedBox(height: 20.0),
        ..._items,
      ],
    );
  }
}
