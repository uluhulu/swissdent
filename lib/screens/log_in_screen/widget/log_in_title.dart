import 'package:flutter/material.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
///log in title
class LogInTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Text(
      logInTitle,
      style: semiBold24Style,
    );
  }
}
