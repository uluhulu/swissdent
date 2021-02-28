import 'package:flutter/material.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
///restore title
class RestoreTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      restoreTitle,
      style: semiBold24Style,
    );
  }
}
