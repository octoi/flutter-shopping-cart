import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shopping_cart/utils/constants.dart';

class Tags extends StatefulWidget {
  final data;
  final Function search;
  const Tags({
    Key? key,
    this.data,
    required this.search,
  }) : super(key: key);

  @override
  _TagsState createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  String selected = 'All';

  List<Widget> getCategories() {
    List<Widget> widgets = [];
    var categories = new Map();

    widgets.add(TagButton(
      category: 'All',
      isSelected: selected == 'All',
      onSelect: () {
        setState(() => selected = 'All');
        widget.search('');
      },
    ));

    widget.data.forEach((item) {
      String category = item['category'];
      if (categories[category] == null) {
        categories[category] = category;
        widgets.add(
          TagButton(
            category: category,
            isSelected: selected == category,
            onSelect: () {
              setState(() => selected = category);
              widget.search(category);
            },
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

class TagButton extends StatelessWidget {
  final String category;
  final bool isSelected;
  final Function onSelect;

  const TagButton({
    Key? key,
    required this.category,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelect(),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: appAccentColor),
          color: isSelected ? appAccentColor : null,
        ),
        child: Text(
          category,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: !isSelected ? appAccentColor : appPrimaryColor,
          ),
        ),
      ),
    );
  }
}
