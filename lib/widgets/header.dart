import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget location;

  const Header({
    Key? key,
    required this.title,
    required this.icon,
    required this.location,
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
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (ctx) => location),
          ),
          icon: Icon(icon),
        )
      ],
    );
  }
}
