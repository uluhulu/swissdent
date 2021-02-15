import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';

///registration svreen countdown sms timer
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=2%3A1457
class RegistrationCountdown extends StatelessWidget {
  final int timerCount;

  const RegistrationCountdown({Key key, this.timerCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: timerCountdownText1,
          style: normal11Style,
          children: <TextSpan>[
            TextSpan(text: timerCount.toString(), style: normal11StyleRed),
            TextSpan(
              text: timerCountdownText2,
              style: normal11Style,
            ),
          ]),
    );
  }
}
