import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final bool isHomeScreen;

  const Header({
    Key? key,
    this.isHomeScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isHomeScreen
        ? Text(
            'All Items',
            style: TextStyle(
              fontSize: 20.0,
              letterSpacing: 0.3,
            ),
          )
        : IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios),
          );
  }
}
