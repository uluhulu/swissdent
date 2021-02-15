import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:swissdent/widget/swissdent_textfield/base/swissdent_text_field.dart';

class SwissdentNumTextField extends StatefulWidget {
  final Function(String unmaskedText) onNumberType;
  final bool readOnly;
  final String defaultText;
  final FocusNode focusNode;
  final Function(String text) onSubmitted;

  const SwissdentNumTextField({
    Key key,
    this.onNumberType,
    this.readOnly = false,
    this.defaultText = '',
    this.focusNode, this.onSubmitted,
  }) : super(key: key);

  @override
  _SwissdentNumTextFieldState createState() => _SwissdentNumTextFieldState();
}

class _SwissdentNumTextFieldState extends State<SwissdentNumTextField> {
  static final numPrefix = '+7';
  final maskFormatter = new MaskTextInputFormatter(
    mask: '$numPrefix ### ### ## ##',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  TextEditingController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController(
        text: maskFormatter.maskText('$numPrefix${widget.defaultText}'));
    controller.addListener(() {
      widget.onNumberType(maskFormatter.unmaskText(controller.text));
      if (controller.text.isEmpty) {
        controller.value = controller.value.copyWith(
          text: numPrefix,
          selection: TextSelection.fromPosition(
            TextPosition(offset: numPrefix.length),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SwissdentTextField(
      focusNode: widget.focusNode ?? FocusNode(),
      onSubmitted: widget.onSubmitted ?? (text){},
      maxLength: 16,
      formatter: maskFormatter,
      controller: controller,
      suffixWidget: Icon(Icons.add),
      keyboardType: TextInputType.phone,
      readOnly: widget.readOnly,
    );
  }
}
