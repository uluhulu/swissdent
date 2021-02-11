import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/styles.dart';

class BlueButton extends StatelessWidget {
  final String buttonText;
  final bool isAvaliable;
  final Function() onTap;

  const BlueButton({
    Key key,
    this.buttonText,
    this.isAvaliable = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      child: RaisedButton(
        elevation: 1,
        color: codeButtonColor,
        disabledColor: disableCodeButtonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        onPressed: isAvaliable ? () => onTap() : null,
        child: Text(
          buttonText,
          style: semiBold17WhiteStyle,
        ),
      ),
    );
  }
}
