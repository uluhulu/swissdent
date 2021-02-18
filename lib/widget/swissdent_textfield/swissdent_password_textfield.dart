import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/widget/swissdent_textfield/base/swissdent_text_field.dart';

class SwissdentPasswordField extends StatefulWidget {
  final Function(String password) onPasswordType;
  final String hintText;
  final FocusNode focusNode;
  final Function(String text) onSubmitted;

  const SwissdentPasswordField({
    Key key,
    this.onPasswordType, this.hintText, this.focusNode, this.onSubmitted,
  }) : super(key: key);

  @override
  _SwissdentPasswordFieldState createState() => _SwissdentPasswordFieldState();
}

class _SwissdentPasswordFieldState extends State<SwissdentPasswordField> {
  final controller = TextEditingController();
  var isVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      widget.onPasswordType(controller.text);
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SwissdentTextField(
      focusNode: widget.focusNode,
      maxLength: 16,
      controller: controller,
      isVisible: true,
      obscureText: !isVisible,
      suffixWidget: _buildVisibilityIcon(),
      keyboardType: TextInputType.text,
      hintText: widget.hintText,
      maxLines: 1,
      hintStyle: normal15Style,
      onSubmitted: widget.onSubmitted,
    );
  }

  Widget _buildVisibilityIcon() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isVisible = !isVisible;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 12.0,
          bottom: 15,
          right: 21,
        ),
        child: Image.asset(
          isVisible ? iconVisibilityOn : iconVisibilityOff,
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
