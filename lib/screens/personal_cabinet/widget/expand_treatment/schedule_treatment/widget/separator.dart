import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';

///separator of card
///todo figma link
class Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      color: stageCardSeparatorColor,
    );
  }
}
