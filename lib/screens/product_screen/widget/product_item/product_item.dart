import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/util/money_formatter.dart';

///item of product
///todo figma link
class ProductItem extends StatelessWidget {
  ///url of product image
  final String productImagePath;

  ///cost of product
  final double productCost;

  ///product description
  final String productDescription;

  const ProductItem({
    Key key,
    this.productImagePath,
    this.productCost,
    this.productDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: productCardColor,
          borderRadius: BorderRadius.all(Radius.circular(14)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 7),
              blurRadius: 15,
              color: shadowBlackColor.withOpacity(0.1),
            ),
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 4,
              color: shadowWhiteColor.withOpacity(0.25),
            ),
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 134,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProductPhoto(),
                SizedBox(height: 16),
                _buildProductCost(),
                SizedBox(height: 4),
                _buildProductDescription(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductPhoto() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(14)),
      child: Image.network(
        productImagePath,
        fit: BoxFit.fitWidth,
        width: 134,
        height: 134,
        loadingBuilder: (context, image, loadChunk) {
          if (loadChunk == null) {
            return image;
          }

          return Center(
            child: CircularProgressIndicator(
              value: loadChunk.expectedTotalBytes != null
                  ? loadChunk.cumulativeBytesLoaded /
                      loadChunk.expectedTotalBytes
                  : null,
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductCost() {
    return Text(
      '${formatMoney(productCost)} $rubPrefix',
      style: bold15StyleBlack,
    );
  }

  Widget _buildProductDescription() {
    return Text(
      productDescription,
      style: normal12StyleGrey,
    );
  }
}
