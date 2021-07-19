import 'package:flutter/material.dart';
import 'package:shopping_cart/utils/constants.dart';

class Tags extends StatefulWidget {
  final data;
  const Tags({Key? key, this.data}) : super(key: key);

  @override
  _TagsState createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  List<Widget> getCategories() {
    List<Widget> widgets = [];
    var categories = new Map();

    widget.data.forEach((item) {
      String category = item['category'];
      if (categories[category] == null) {
        categories[category] = category;
        widgets.add(
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            margin: EdgeInsets.all(10.0),
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
          ),
        );
      }
    });

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        children: getCategories(),
      ),
    );
  }
}
