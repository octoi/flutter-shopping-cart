import 'package:flutter/material.dart';
import 'package:shopping_cart/utils/constants.dart';

class SearchBar extends StatelessWidget {
  final onChange;
  final List data;

  const SearchBar({
    Key? key,
    this.onChange,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
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
      ),
      SizedBox(height: 20.0),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Row(
          children: data.map((item) {
            String category = item['category'];
            return Container(
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: appAccentColor),
              ),
              child: Text(
                category,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: appAccentColor,
                ),
              ),
            );
          }).toList(),
        ),
      )
    ]);
  }
}
