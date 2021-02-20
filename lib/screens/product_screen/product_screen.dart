import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/screens/product_screen/widget/product_expand/product_expand_category.dart';
import 'package:swissdent/screens/product_screen/widget/product_item/product_item.dart';
import 'package:swissdent/screens/product_screen/widget/search_appbar/search_appbar.dart';

///screen of products
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=11%3A2993
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
