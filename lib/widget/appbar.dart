import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/styles.dart';

PreferredSizeWidget buildAppbar({
  Color backgroundColor,
  String titleText,
  Widget action,
  VoidCallback onBackCallback,
}) {
  return AppBar(
    backgroundColor: backgroundColor ?? appbarColor,
    brightness: Brightness.light,
    elevation: 0,
    title: Text(
      titleText,
      style: bold17BlackStyle,
    ),
    actions: [
      action ?? SizedBox(),
    ],
    leading: CupertinoButton(
      onPressed: onBackCallback,
      child: Icon(
        Icons.arrow_back_ios_rounded,
        color: backLeadingButtonColor,
      ),
    ),
  );
}
