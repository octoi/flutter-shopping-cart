import 'package:flutter/material.dart';
import 'package:shopping_cart/utils/constants.dart';
import 'package:shopping_cart/widgets/header.dart';
import 'package:shopping_cart/widgets/item_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(isHomeScreen: true),
              SizedBox(height: 20.0),
              ItemList(),
            ],
          ),
        ),
      ),
    );
  }
}
