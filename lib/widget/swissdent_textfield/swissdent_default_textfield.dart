import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/widget/swissdent_textfield/base/swissdent_text_field.dart';

class SwissdentDefaultTextField extends StatefulWidget {
  final Function(String text) onType;
  final String hint;
  final FocusNode focusNode;
  final Function(String text) onSubmitted;
  final String defaultText;
  final TextEditingController customController;

  const SwissdentDefaultTextField({
    Key key,
    this.onType,
    this.hint,
    this.focusNode,
    this.onSubmitted,
    this.defaultText = '',
    this.customController,
  }) : super(key: key);

  @override
  _SwissdentDefaultTextFieldState createState() =>
      _SwissdentDefaultTextFieldState();
}

class _SwissdentDefaultTextFieldState extends State<SwissdentDefaultTextField> {
  TextEditingController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController(
        text: widget.defaultText.isNotEmpty ? widget.defaultText : '');
    controller.addListener(() {
      widget.onType(controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SwissdentTextField(
      focusNode: widget.focusNode,
      controller: widget.customController ?? controller,
      hintText: widget.hint,
      hintStyle: normal15Style,
      keyboardType: TextInputType.text,
      onSubmitted: widget.onSubmitted,
    );
  }
}
