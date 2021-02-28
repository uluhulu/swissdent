import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';

import 'base/swissdent_text_field.dart';

class SwissdentSmsCodeTextField extends StatefulWidget {
  final bool isVisible;
  final Function(String unmaskedText) onCodeType;
  final FocusNode focusNode;
  final Function(String text) onSubmitted;



  const SwissdentSmsCodeTextField({Key key, this.isVisible, this.onCodeType, this.focusNode, this.onSubmitted}) : super(key: key);

  @override
  _SwissdentSmsCodeTextFieldState createState() =>
      _SwissdentSmsCodeTextFieldState();
}

class _SwissdentSmsCodeTextFieldState extends State<SwissdentSmsCodeTextField> {
  final maskFormatter = new MaskTextInputFormatter(
    mask: '# # # #',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  final controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      widget.onCodeType(maskFormatter.unmaskText(controller.text));
    },);
  }
  @override
  Widget build(BuildContext context) {
    return SwissdentTextField(
      onSubmitted: widget.onSubmitted ?? (text){},
      focusNode: widget.focusNode,
      keyboardType: TextInputType.number,
      maxLength: 7,
      formatter: maskFormatter,
      controller: controller,
      hintText: smsConfirmationHintText,
      hintStyle: normal15Style,
      isVisible: widget.isVisible,
      suffixWidget: Padding(
        padding: const EdgeInsets.only(top: 15.0, right : 16.0, bottom: 14.0),
        child: Image.asset(iconDonePath, width: 22,),
      ),
    );
  }
}
