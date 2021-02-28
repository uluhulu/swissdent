import 'package:flutter/material.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
///forget password title
class ForgetPasswordTitle extends StatelessWidget {
  final Function() onTap;

  const ForgetPasswordTitle({Key key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onTap(),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          forgetPasswordTitle,
          style: normal15StyleBlue,
        ),
      ),
    );
  }
}
