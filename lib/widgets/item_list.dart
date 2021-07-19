import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping_cart/api/api.dart';
import 'package:shopping_cart/utils/constants.dart';
import 'package:shopping_cart/widgets/search_bar.dart';

import 'item_card.dart';

class ItemList extends StatefulWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  List<Widget> _items = [];
  List _data = [];
  bool loading = false;

  void displayData(List data) {
    List<Widget> _widgets = [];
    data.forEach((data) {
      _widgets.add(ItemCard(data: data));
    });
    setState(() {
      _items = _widgets;
    });
  }

  void getData() async {
    var res = await fetchData();
    displayData(res);
    setState(() {
      _data = res;
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() => loading = true);
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBar(
          onChange: (String searchQuery) {
            searchQuery = searchQuery.toLowerCase();
            if (searchQuery == '') {
              displayData(_data);
            } else {
              List filteredData = _data.where((item) {
                String title = item['title'].toLowerCase();
                String category = item['category'].toLowerCase();
                String price = item['price'].toString();

                return title.contains(searchQuery) ||
                    category.contains(searchQuery) ||
                    price.contains(searchQuery);
              }).toList();
              displayData(filteredData);
            }
          },
          data: _data,
        ),
        SizedBox(height: 20.0),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          physics: ScrollPhysics(),
          childAspectRatio: (MediaQuery.of(context).size.width / 2) /
              (MediaQuery.of(context).size.height / 2),
          children: !loading
              ? _items
              : List.generate(
                  10,
                  (_) => Shimmer.fromColors(
                    baseColor: appSecondaryColor,
                    highlightColor: appPrimaryColor,
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: appSecondaryColor,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: appSecondaryColor,
                            spreadRadius: 1,
                            blurRadius: 15,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
