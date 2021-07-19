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
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: appPrimaryColor,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: appSecondaryColor,
            spreadRadius: 1,
            blurRadius: 15,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Hero(
              tag: '$id-image',
              child: Image.network(image),
            ),
          ),
          SizedBox(height: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10.0),
              Text(
                '\$$price',
                style: TextStyle(
                  fontSize:
                      MediaQuery.of(context).size.width <= 500 ? 15.0 : 18.0,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10.0),
              Container(
                width: double.infinity,
                height: 40.0,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => DetailScreen(data: data),
                      ),
                    );
                  },
                  child: Text(
                    "View Details",
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
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
