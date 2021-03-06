import 'package:flutter/material.dart';
import 'package:shopping_cart/utils/constants.dart';
import 'package:shopping_cart/widgets/header.dart';

class DetailScreen extends StatelessWidget {
  final data;

  const DetailScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String id = data['id'].toString();
    String title = data['title'];
    String price = data['price'].toString();
    String image = data['image'];
    String description = data['description'];
    String category = data['category'];

    return Scaffold(
      backgroundColor: appPrimaryColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(child: Header()),
            SizedBox(height: 20.0),
            Center(
              child: Hero(
                tag: '$id-image',
                child: MediaQuery.of(context).size.width <= 500
                    ? Image.network(image)
                    : Image.network(image, width: 500.0),
              ),
            ),
            SizedBox(height: 40.0),
            Text(
              title,
              style: TextStyle(
                color: appAccentColor,
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15.0,
                  ),
                  decoration: BoxDecoration(
                    color: appAccentColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    '\$$price',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: appAccentColor),
                  ),
                  child: Text(
                    category,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: appAccentColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Text(
              description,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 30.0),
            InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 50.0,
                decoration: BoxDecoration(
                  color: appAccentColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    "Add To Cart",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
