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
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Header(isHomeScreen: true),
              ItemList(),
            ],
          ),
        ),
      ),
    );
  }
}
