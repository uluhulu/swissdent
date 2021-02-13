import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/util/money_formatter.dart';

///cart total board
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=3%3A5893
///price discount total
class CartTotalBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: cartTotalBoardColor,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 60.0,
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            SizedBox(height: 16),
            _buildCostRow(price, 5600),
            SizedBox(height: 24),
            _buildCostRow(discount, 600),
            SizedBox(height: 53),
            _buildTotalRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildCostRow(final rowName, double amount) {
    return Row(
      children: [
        Text(
          rowName,
          style: normal15StyleGrey,
        ),
        Spacer(),
        Text(
          "${formatMoney(amount)} $rubPrefix",
          style: bold18Black,
        ),
      ],
    );
  }

  Widget _buildTotalRow() {
    return Row(
      children: [
        Text(
          total,
          style: bold18Grey2,
        ),
        Spacer(),
        Text(
          "${formatMoney(5000)} $rubPrefix",
          style: bold24Black,
        ),
      ],
    );
  }
}