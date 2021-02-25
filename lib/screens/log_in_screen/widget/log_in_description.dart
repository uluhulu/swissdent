import 'package:flutter/material.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
///log in description
class LogInDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      logInDescription,
      textAlign: TextAlign.center,
      style: semiBold17Style,
    );
  }
}
