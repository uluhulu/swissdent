import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';

///cart info widget
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=3%3A5386
class CartInfo extends StatelessWidget {
  final int productCount;

  const CartInfo({
    Key key,
    this.productCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          SizedBox(height: 16),
          Container(
            width: double.infinity,
            height: 1,
            color: cartInfoSeparatorColor,
          ),
          SizedBox(height: 16),
          _buildCartInfo()
        ],
      ),
    );
  }

  Widget _buildCartInfo() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cartInfoTitle,
              style: normal15StyleGrey,
            ),
            SizedBox(height: 4),
            Text(
              '$productCount cartInfoProducts',
              style: semiBold17BlackStyle,
            ),
          ],
        ),
        Spacer(),
        Image.asset(
          iconCartArrow,
          width: 11,
          height: 22,
        ),
      ],
    );
  }
}
