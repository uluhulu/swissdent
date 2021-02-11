import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/styles.dart';

class SwissdentTextField extends StatelessWidget {
  final int maxLength;
  final TextInputFormatter formatter;
  final TextEditingController controller;
  final String hintText;
  final Widget suffixWidget;
  final TextStyle hintStyle;
  final bool isVisible;
  final TextInputType keyboardType;

  SwissdentTextField({
    Key key,
    this.maxLength = 100,
    this.formatter,
    this.controller,
    this.hintText = "",
    this.suffixWidget,
    this.hintStyle,
    this.isVisible = false,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildTextField();
  }

  Widget _buildTextField() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 51,
      decoration: BoxDecoration(
        color: textFieldColor,
        border: Border.all(color: textFieldBorderColor),
        borderRadius: BorderRadius.all(
          Radius.circular(45),
        ),
      ),
      child: Row(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 23.0),
              child: TextField(
                keyboardType: keyboardType,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.all(0),
                  hintText: hintText,
                  hintStyle: hintStyle,
                  counter: Container(
                    height: 1,
                  ),
                ),
                maxLength: maxLength,
                style: boldStyle,
                controller: controller ?? TextEditingController(),
                inputFormatters: [
                  formatter,
                ],
              ),
            ),
          ),
          isVisible ? suffixWidget : Container(),
        ],
      ),
    );
  }
}
