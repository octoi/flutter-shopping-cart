import 'package:flutter/material.dart';
import 'package:shopping_cart/api/api.dart';
import 'package:shopping_cart/utils/constants.dart';

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
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: Image.network(image, width: 100.0),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 10.0),
                Text(
                  '\$$price',
                  style: TextStyle(fontSize: 15.0),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 10.0),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "View Detail",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) => appAccentColor,
                    ),
                    padding: MaterialStateProperty.resolveWith(
                      (states) => EdgeInsets.all(10.0),
                    ),
                    overlayColor: MaterialStateColor.resolveWith(
                      (states) => Color(0xFF262341),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
