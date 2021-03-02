import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/util/mask_formatter.dart';
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

  final formatter = MaskTextInputFormatter(
    mask: '$numPrefix ### ### ## ##',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  @override
  void initState() {
    super.initState();
    initController();
  }

  @override
  void didChangeDependencies() {

  }

  @override
  void didUpdateWidget(covariant SwissdentNumTextField oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    updateControllerText();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  void initController() {
    controller = TextEditingController(
        text: formatter.maskText('$numPrefix${widget.defaultText}'));

    controller.addListener(() {
      if (widget.onNumberType != null) {
        widget.onNumberType(formatter.unmaskText(controller.text));
      }

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

  void updateControllerText(){
    controller.text = formatter.maskText('$numPrefix${widget.defaultText}');
    if (controller.text.isEmpty) {
      controller.value = controller.value.copyWith(
        text: numPrefix,
        selection: TextSelection.fromPosition(
          TextPosition(offset: numPrefix.length),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SwissdentTextField(
      focusNode: widget.focusNode ?? FocusNode(),
      onSubmitted: widget.onSubmitted ?? (text) {},
      maxLength: 16,
      formatter: formatter,
      controller: widget.customController ?? controller,
      suffixWidget: Icon(Icons.add),
      keyboardType: TextInputType.phone,
      readOnly: widget.readOnly,
    );
  }
}
