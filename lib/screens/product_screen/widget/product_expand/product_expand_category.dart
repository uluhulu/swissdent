import 'package:flutter/material.dart';
import 'package:swissdent/screens/product_screen/widget/product_item/product_item.dart';
import 'package:swissdent/widget/expandable/expand_without_header.dart';
import 'package:swissdent/widget/fixed_height_delegate.dart';

///expandable category for products
class ProductExpandCategory extends StatefulWidget {
  ///name of prodcuts category
  final String categoryName;

  const ProductExpandCategory({Key key, this.categoryName}) : super(key: key);

  @override
  _ProductExpandCategoryState createState() => _ProductExpandCategoryState();
}

class _ProductExpandCategoryState extends State<ProductExpandCategory> {
  @override
  Widget build(BuildContext context) {
    return ExpandWithoutHeader(
      cardName: widget.categoryName,
      expandableBody: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GridView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
            crossAxisCount: 2,
            height: 270,
          ),
          children: [
            ProductItem(
              productCost: 1200,
              productDescription:
                  'Зубная щетка (АБСТРАКЦИОНИСТ)0,15fdsfsfdsfdsfdsfdsfsdfsdfsdfsdfsdfsdfsdfsdfsdfsSOFTfsdfdsfsdfsdfsdfsdfdsfdsfdsfdsfsdfsdfsdfsdfsdfsdfsdfsdfsdfs',
              productImagePath:
                  'https://dizion.ru/image/cache/catalog/Katalog/Gigiyena-polosti-rta/Zubnyye-shchetki/vitis_ultrasoft_zubnaya_shetka_m_u2-700x700.jpg',
            ),
            // SizedBox(width: 16),
            ProductItem(
              productCost: 1200,
              productDescription: 'Зубная щетка (АБСТРАКЦИОНИСТ)0,15 SOFT',
              productImagePath:
                  'https://dizion.ru/image/cache/catalog/Katalog/Gigiyena-polosti-rta/Zubnyye-shchetki/vitis_ultrasoft_zubnaya_shetka_m_u2-700x700.jpg',
            ),
            ProductItem(
              productCost: 1200,
              productDescription: 'Зубная щетка (АБСТРАКЦИОНИСТ)0,15 SOFT',
              productImagePath:
                  'https://dizion.ru/image/cache/catalog/Katalog/Gigiyena-polosti-rta/Zubnyye-shchetki/vitis_ultrasoft_zubnaya_shetka_m_u2-700x700.jpg',
            ),
            ProductItem(
              productCost: 1200,
              productDescription: 'Зубная щетка (АБСТРАКЦИОНИСТ)0,15 SOFT',
              productImagePath:
                  'https://dizion.ru/image/cache/catalog/Katalog/Gigiyena-polosti-rta/Zubnyye-shchetki/vitis_ultrasoft_zubnaya_shetka_m_u2-700x700.jpg',
            ),
            ProductItem(
              productCost: 1200,
              productDescription: 'Зубная щетка (АБСТРАКЦИОНИСТ)0,15 SOFT',
              productImagePath:
                  'https://dizion.ru/image/cache/catalog/Katalog/Gigiyena-polosti-rta/Zubnyye-shchetki/vitis_ultrasoft_zubnaya_shetka_m_u2-700x700.jpg',
            ),
          ],
        ),
      ),
    );
  }
}
