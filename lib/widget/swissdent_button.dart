import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/styles.dart';

class SwissdentButton extends StatelessWidget {
  final Widget buttonText;
  final bool isAvaliable;
  final Function() onTap;
  final Color buttonColor;
  final double width;

  const SwissdentButton({
    Key key,
    this.buttonText,
    this.isAvaliable = false,
    this.onTap,
    this.buttonColor,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: width,
      child: RaisedButton(
        elevation: 1,
        color: buttonColor,
        disabledColor: disableCodeButtonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        onPressed: isAvaliable ? () => onTap() : null,
        child: buttonText,
      ),
    );
  }
}
