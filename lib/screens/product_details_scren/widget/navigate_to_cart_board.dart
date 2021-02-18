import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/screens/cart_screen/cart_screen.dart';
import 'package:swissdent/util/route_builder.dart';
///navigate to cart board
///https://www.figma.com/file/sw9XeUaCK0EN7jQ5ZzsFne/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F-(Copy)?node-id=12%3A860
class NavigateToCartBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // width: 343,
        // height: 67,
        decoration: BoxDecoration(
          color: paymentInfoBoardColor,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 11,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            productIsAdded,
            style: normal18StyleGrey,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () => _navigateToCartScreen(context),
            child: Text(
              navigate,
              style: bold18StyleGreen,
            ),
          )
        ],
      ),
    );
  }
  void _navigateToCartScreen(BuildContext context) {
    Navigator.of(context).push(buildRoute(CartScreen()));
  }
}
