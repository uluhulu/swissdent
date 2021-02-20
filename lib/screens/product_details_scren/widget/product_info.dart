import 'package:flutter/material.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/screens/product_details_scren/widget/product_count_board.dart';
import 'package:swissdent/util/money_formatter.dart';

class ProductDetailsInfo extends StatelessWidget {
  final double productCost;
  final String productName;
  final String productDescription;

  const ProductDetailsInfo({
    Key key,
    this.productCost,
    this.productName,
    this.productDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductSum(),
            SizedBox(
              height: 16,
            ),
            // _buildProductName(),
            // SizedBox(
            //   height: 32,
            // ),
            _buidProductDiscription(),
            ProductionCountBoard(),
          ],
        ),
      ),
    );
  }

  Widget _buildProductSum() {
    return Text(
      '${formatMoney(productCost)} руб ',
      style: bold24Black,
    );
  }

  Widget _buildProductName() {
    return Text(
      productName,
      style: normal18StyleGrey,
    );
  }

  Widget _buidProductDiscription() {
    return Text(
      productDescription,
      style: light15StyleGrey,
    );
  }
}
