import 'package:flutter/material.dart';
import 'package:shopping_cart/utils/constants.dart';

class DetailScreen extends StatelessWidget {
  final data;

  const DetailScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
