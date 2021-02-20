import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/constants/strings.dart';

///import documents widget
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=17%3A1255
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
