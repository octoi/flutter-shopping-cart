import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shopping_cart/utils/constants.dart';

class SearchBar extends StatelessWidget {
  final onChange;

  const SearchBar({Key? key, this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: appSecondaryColor,
            spreadRadius: 1,
            blurRadius: 15,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: appPrimaryColor),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: appPrimaryColor),
          ),
          prefixIcon: Icon(Icons.search),
          fillColor: appPrimaryColor,
          filled: true,
          hintText: 'Search for products',
        ),
        onChanged: onChange,
      ),
    );
  }
}
