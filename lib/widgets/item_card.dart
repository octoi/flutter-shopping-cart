import 'package:flutter/material.dart';
import 'package:shopping_cart/screens/detail_screen.dart';
import 'package:shopping_cart/utils/constants.dart';

class ItemCard extends StatelessWidget {
  final data;

  const ItemCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String id = data['id'].toString();
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
            child: Hero(
              tag: '$id-image',
              child: Image.network(image, width: 100.0),
            ),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => DetailScreen(data: data),
                      ),
                    );
                  },
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
