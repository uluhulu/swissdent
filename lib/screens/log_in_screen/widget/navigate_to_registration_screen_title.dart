import 'package:flutter/material.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';

class NavigateToRegistrationScreenTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: navigateToRegistrationText,
          style: normal15StyleGrey,
          children: <TextSpan>[
            TextSpan(text: registrationTitle, style: normal15StyleBlue),
          ]),
    );
  }
}
