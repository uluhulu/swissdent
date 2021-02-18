import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/screens/cart_screen/widget/product_card/widget/product_icon.dart';
import 'package:swissdent/util/money_formatter.dart';

class ProductInfo extends StatefulWidget {
  final String productDescription;
  final double productCost;
  final String photoPath;
  final int productAmount;

  const ProductInfo(
      {Key key,
      this.productDescription,
      this.productCost,
      this.photoPath,
      this.productAmount})
      : super(key: key);

  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ProductIcon(productPath: widget.photoPath ,),
        SizedBox(width: 16),
        _buildProductInfo(),
        SizedBox(width: 16),
        _buildProductAmount(),
      ],
    );
  }

  Widget _buildProductInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
      child: Container(
        width: 125,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${formatMoney(widget.productCost)} $rubPrefix",
              style: bold15StyleBlack,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              widget.productDescription,
              style: normal12StyleGrey.copyWith(height: 1.4),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductAmount() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 52.0, top: 32, right: 16.0),
      child: Row(
        children: [
          GestureDetector(
            child: Image.asset(
              iconMinus,
              height: 35,
              width: 35,
            ),
          ),
          SizedBox(
            width: _buildCostPadding() ,
          ),
          Text(
            widget.productAmount.toString(),
            style: bold24BlackStyle,
          ),
          SizedBox(
            width: _buildCostPadding() ,
          ),
          GestureDetector(
            child: Image.asset(
              iconPlus,
              height:35 ,
              width: 35,
              // width: 10,
            ),
          ),
        ],
      ),
    );
  }
  double _buildCostPadding() {
    if (widget.productAmount < 10) {
      return 24;
    }
    if (widget.productAmount >= 10 && widget.productAmount < 100) {
      return 18;
    }

    if (widget.productAmount >= 100 && widget.productAmount < 1000) {
      return 11;
    }
    return 2;
  }
}
