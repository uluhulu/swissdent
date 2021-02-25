import 'package:flutter/material.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';

///registration screen title
///https://www.figma.com/file/sw9XeUaCK0EN7jQ5ZzsFne/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F-(Copy)?node-id=2%3A97
class RegistrationTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      restoreTitle,
      style: semiBold24Style,
    );
  }
}
