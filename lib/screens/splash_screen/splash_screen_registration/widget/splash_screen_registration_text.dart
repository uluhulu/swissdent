import 'package:flutter/cupertino.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';

///splash screen registration text
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=3%3A2692
class SplashScreenRegistrationText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Text(
        successfulRegistration,
        textAlign: TextAlign.center,
        style: semiBold24WhiteStyle.copyWith(height: 1),
      ),
    );
  }
}
