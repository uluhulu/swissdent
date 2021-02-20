import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';

class HelpScreenBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: backgroundColor,
    );
  }
}