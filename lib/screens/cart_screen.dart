import 'package:flutter/material.dart';
import 'package:shopping_cart/utils/constants.dart';
import 'package:shopping_cart/widgets/header.dart';

import 'home_screen.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
              Header(
                title: "Cart",
                icon: Icons.arrow_back,
              )
            ],
          ),
        ),
      ),
    );
  }
}
