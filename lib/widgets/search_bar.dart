import 'package:flutter/material.dart';
import 'package:shopping_cart/utils/constants.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appSecondaryColor),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: appSecondaryColor),
        ),
        prefixIcon: Icon(Icons.search),
        fillColor: appSecondaryColor,
        filled: true,
        hintText: 'Search for products',
      ),
    );
  }
}
