import 'package:flutter/material.dart';
import 'package:shopping_cart/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Shopping Cart",
                style: TextStyle(fontSize: 30.0, color: appAccentColor),
              ),
              SizedBox(height: 10.0),
              Text(
                "Buy what you want",
                style: TextStyle(fontSize: 15.0, color: appAccentColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
