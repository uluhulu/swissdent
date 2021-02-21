import 'package:flutter/material.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';

class LogInWithAccounts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Text(
      logInWithAccountsHint,
      textAlign: TextAlign.center,
      maxLines: 3,
      style: normal17StyleGrey,
    );
  }
}
