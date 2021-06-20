import 'package:flutter/material.dart';
import 'package:shopping_cart/screens/cart_screen.dart';
import 'package:shopping_cart/utils/constants.dart';
import 'package:shopping_cart/widgets/header.dart';

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
              Header(
                title: "All Items",
                icon: Icons.shopping_cart_outlined,
                isHomeScreen: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
