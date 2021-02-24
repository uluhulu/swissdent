import 'package:flutter/material.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
///regisration with accounts text
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=2%3A1378
class RegistrationWithAccounts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Text(
      registrationWithAccountsHint,
      textAlign: TextAlign.center,
      maxLines: 3,
      style: normal17StyleGrey,
    );
  }
}
