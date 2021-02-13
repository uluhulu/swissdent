import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/mocks.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/screens/cart_screen/widget/product_card/product_card.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/schedule_treatment/widget/separator.dart';
import 'package:swissdent/util/money_formatter.dart';
/// cart screen
/// https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=3%3A5893
class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cartBackgroundColor,
      appBar: AppBar(
        backgroundColor: cartBackgroundColor,
        leading: IconButton(
          icon: Image.asset(iconBack, width: 12.27,height: 20.66,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          cart,
          style: semiBold17BlackStyle,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 10,
                right: 16,
              ),
              child: Image.asset(
                iconChat,
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody(){
    return Column(
      children: [
        _buildList(),
      ],
    );
  }

  Widget _buildList(){
    return Column(
      children: _buildTemplates()
    );
  }
  List<Widget> _buildTemplates() {
    final templateList = <Widget>[];
    for (var index = 0; index < cartItemsMockList.length; index++) {
      final template = cartItemsMockList[index];
      templateList.add(template);

      if (index != cartItemsMockList.length - 1) {
        templateList.add(Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: Separator(),
        ));
      }
    }
    return templateList;
  }
}
