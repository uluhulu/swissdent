import 'package:flutter/material.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
///restore discription
class RestoreDiscription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      restoreDiscription,
      textAlign: TextAlign.center,
      maxLines: 3,
      style: semiBold17Style,
    );
  }
}
