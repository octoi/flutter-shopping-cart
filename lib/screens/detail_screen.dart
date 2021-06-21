import 'package:flutter/material.dart';
import 'package:shopping_cart/utils/constants.dart';

class DetailScreen extends StatelessWidget {
  final data;

  const DetailScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = data['title'];
    String price = data['price'].toString();
    String image = data['image'];
    String description = data['description'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appPrimaryColor,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios),
          color: appAccentColor,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(image),
            SizedBox(height: 40.0),
            Text(
              title,
              style: TextStyle(
                color: appAccentColor,
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              '\$$price',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
