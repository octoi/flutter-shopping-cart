import 'package:flutter/material.dart';
import 'package:shopping_cart/screens/cart_screen.dart';

class Header extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isHomeScreen;

  const Header({
    Key? key,
    required this.title,
    required this.icon,
    this.isHomeScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 23.0,
            letterSpacing: 0.3,
          ),
        ),
        IconButton(
          onPressed: () {
            isHomeScreen
                ? Navigator.push(
                    context,
                    MaterialPageRoute(builder: (ctx) => CartScreen()),
                  )
                : Navigator.pop(context);
          },
          icon: Icon(icon),
        )
      ],
    );
  }
}
