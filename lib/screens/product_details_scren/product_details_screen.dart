import 'package:flutter/material.dart';
import 'package:swissdent/constants/mocks.dart';
import 'package:swissdent/screens/cart_screen/widget/product_card/widget/product_info.dart';
import 'package:swissdent/screens/product_details_scren/widget/product_count_board.dart';
import 'package:swissdent/screens/product_details_scren/widget/product_info.dart';
import 'package:swissdent/screens/product_details_scren/widget/product_photo.dart';

///product details screen
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=12%3A511
class ProductDetailsScreen extends StatefulWidget {
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProductPhoto(
            photoPath: 'https://doctorslon.ru/upload/iblock/c87/MC405_5png.png',
            width: MediaQuery.of(context).size.width,
            onBackCallback: () {},
          ),
          _buildBody(),
        ],
      ),

      // body:         _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      child: ProductDetailsInfo(
        productCost: 1200,
        productName: 'Зубная щетка (АБСТРАКЦИОНИСТ) 0,15 SOFT',
        productDescription: productDescription,
      ),
    );
  }
}
