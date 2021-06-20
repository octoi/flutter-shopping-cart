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
      children: _items,
    );
  }
}

class ItemCard extends StatelessWidget {
  final data;

  const ItemCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = data['title'];
    String price = data['price'].toString();
    String image = data['image'];

    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [Container()],
      ),
    );
  }
}
