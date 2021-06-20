import 'package:flutter/material.dart';

void main() {
  runApp(ShoppingCart());
}

class ShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}
