import 'package:flutter/material.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
///registration
class NavigateToRegistrationScreenTitle extends StatelessWidget {
  final Function() onTap;

  const NavigateToRegistrationScreenTitle({Key key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onTap(),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: navigateToRegistrationText,
            style: normal15StyleGrey,
            children: <TextSpan>[
              TextSpan(text: registrationTitle, style: normal15StyleBlue),
            ]),
      ),
    );
  }
}
