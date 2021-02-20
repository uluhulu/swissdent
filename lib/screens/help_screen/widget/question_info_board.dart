import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';

class QuestionInfoBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 25),
      child: Container(
        width: 343,
        height: 67,
        decoration: BoxDecoration(
          color: paymentInfoBoardColor,
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
        ),
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 21,
        vertical: 15.5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconDonePath,
            width: 22,
            height: 22,
          ),
          SizedBox(
            width: 8.45,
          ),
          Container(
            width: 210,
            height: 36,
            child: Text(
              questionInfoText,
              style: normal15StyleGreen,
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }
}
