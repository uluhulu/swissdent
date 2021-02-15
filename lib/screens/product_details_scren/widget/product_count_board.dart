import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/widget/swissdent_button.dart';
///production count board
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=12%3A511
class ProductionCountBoard extends StatelessWidget {
  final int productAmount;

  const ProductionCountBoard({Key key, this.productAmount}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildProductAmount(),
      ],
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
            width: 21,
          ),
          Text(
            (productAmount).toString(),
            style: bold24BlackStyle,
          ),
          SizedBox(
            width: 16,
          ),
          GestureDetector(
            child: Image.asset(
              iconPlus,
              height:35 ,
              width: 35,
              // width: 10,
            ),
          ),
          SwissdentButton(
            width: 51,
            buttonText: _buttonInfo(),
            isAvaliable: true,
            buttonColor: codeButtonColor,
          ),
        ],
      ),
    );
  }

  Widget _buttonInfo(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          iconShoppingCart,
          width: 24,
          height: 24,

        ),
        Text(
          buyButton,
          style: semiBold17WhiteStyle,
        ),
      ],
    );
  }
}
