import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/screens/product_screen/widget/product_expand/product_expand_category.dart';
import 'package:swissdent/screens/product_screen/widget/product_item/product_item.dart';
import 'package:swissdent/screens/product_screen/widget/search_appbar/search_appbar.dart';

///screen of products
///todo figma link
class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          _buildAppbar(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(0),
              children: [
                ProductExpandCategory(categoryName: "Для отбеливания"),
                ProductExpandCategory(
                    categoryName: "Для снятия чувствительности зубов"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppbar() {
    return Container(
      color: appbarColor,
      child: SafeArea(
        bottom: false,
        child: SearchAppbar(),
      ),
    );
  }
}
