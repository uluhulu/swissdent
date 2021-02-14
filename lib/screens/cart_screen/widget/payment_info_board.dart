import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';

///payment info
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=3%3A5893
class PaymentInfoBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 67,
      decoration: BoxDecoration(
        color: paymentInfoBoardColor,
        borderRadius: BorderRadius.all(
          Radius.circular(14),
        ),
      ),
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 15.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconLightBulb,
            width: 22,
            height: 22,
          ),
          SizedBox(width: 8.45,),
          Container(
            width: 271,
            height: 36,
            child: Text(
              paymentInfoText,
              style: normal15StyleGreen,
            ),
          )
        ],
      ),
    );
  }
}
