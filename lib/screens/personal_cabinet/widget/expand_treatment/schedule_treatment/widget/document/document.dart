import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/constants/strings.dart';

///import documents widget
///figma link
class Document extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.only(bottom: 50),
      onPressed: () {},
      child: Row(
        children: [
          Image.asset(
            iconDocument,
            width: 24,
            height: 24,
          ),
          SizedBox(width: 16),
          Text(
            documentsTitle,
            style: bold18Blue,
          ),
        ],
      ),
    );
  }
}
