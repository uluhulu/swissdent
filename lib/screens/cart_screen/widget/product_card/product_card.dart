import 'package:flutter/material.dart';
import 'package:swissdent/screens/cart_screen/widget/product_card/widget/product_info.dart';

class ProductCard extends StatelessWidget {
  final String productDescription;
  final double productCost;
  final String photoPath;
  final String productAmount;

  const ProductCard(
      {Key key,
      this.productDescription,
      this.productCost,
      this.photoPath,
      this.productAmount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124,
      child: ProductInfo(
        productDescription: productDescription,
        productCost: productCost,
        photoPath: photoPath,
        productAmount: productAmount,
      ),
    );
  }
}
