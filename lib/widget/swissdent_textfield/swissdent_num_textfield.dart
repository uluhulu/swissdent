import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/util/mask_formatter_for_request.dart';
import 'package:swissdent/util/mask_formatter_for_ui.dart';
import 'package:swissdent/widget/swissdent_textfield/base/swissdent_text_field.dart';

class SwissdentNumTextField extends StatefulWidget {
  final Function(String unmaskedText) onNumberType;
  final bool readOnly;
  final String defaultText;
  final FocusNode focusNode;
  final Function(String text) onSubmitted;
  final TextEditingController customController;

  const SwissdentNumTextField({
    Key key,
    this.onNumberType,
    this.readOnly = false,
    this.defaultText = '',
    this.focusNode,
    this.onSubmitted,
    this.customController,
  }) : super(key: key);

  @override
  _SwissdentNumTextFieldState createState() => _SwissdentNumTextFieldState();
}

class _SwissdentNumTextFieldState extends State<SwissdentNumTextField> {
  TextEditingController controller;

  @override
  void initState() {
    initController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  void initController() {
    controller = TextEditingController(
        text: maskFormatterForUi.maskText('$numPrefix${widget.defaultText}'));
    controller.addListener(() {
      widget.onNumberType(maskFormatterForUi.unmaskText(controller.text));
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
      onSubmitted: widget.onSubmitted ?? (text) {},
      maxLength: 16,
      formatter: maskFormatterForUi,
      controller: widget.customController != null
          ? widget.customController
          : controller,
      suffixWidget: Icon(Icons.add),
      keyboardType: TextInputType.phone,
      readOnly: widget.readOnly,
    );
  }
}
