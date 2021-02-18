import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/screens/product_details_scren/product_details_screen.dart';
import 'package:swissdent/util/money_formatter.dart';
import 'package:swissdent/util/route_builder.dart';

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
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
      child: GestureDetector(
        onTap: () => _navigateToProductDetailsScreen(context),
        child: Container(
          decoration: BoxDecoration(
              color: productCardColor,
              borderRadius: BorderRadius.all(Radius.circular(14)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 7),
                  blurRadius: 15,
                  color: shadowBlackColor.withOpacity(0.01),
                ),
                BoxShadow(
                  offset: Offset(4, 4),
                  blurRadius: 4,
                  color: shadowWhiteColor.withOpacity(0.25),
                ),
              ]),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              width: 164,
              height: 254,
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
      ),
    );
  }

  Widget _buildProductPhoto() {
    return Align(
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(14)),
        child: Image.network(
          productImagePath,
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
    return Flexible(
      child: Text(
        productDescription,
        overflow: TextOverflow.fade,
        style: normal12StyleGrey.copyWith(height: 1.3),
      ),
    );
  }

  void _navigateToProductDetailsScreen(BuildContext context) {
    Navigator.of(context).push(buildRoute(ProductDetailsScreen()));
  }
}
