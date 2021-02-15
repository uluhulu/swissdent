import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/widget/swissdent_textfield/base/swissdent_text_field.dart';

///textfield for search
///todo figma link
class SwissdentSearchTextField extends StatefulWidget {
  final Function(String text) onType;
  final String hint;
  final FocusNode focusNode;
  final Function(String text) onSubmitted;

  const SwissdentSearchTextField({
    Key key,
    this.onType,
    this.hint,
    this.focusNode,
    this.onSubmitted,
  }) : super(key: key);

  @override
  _SwissdentSearchTextFieldState createState() =>
      _SwissdentSearchTextFieldState();
}

class _SwissdentSearchTextFieldState extends State<SwissdentSearchTextField> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      widget.onType(controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SwissdentTextField(
      focusNode: widget.focusNode,
      controller: controller,
      hintText: widget.hint,
      hintStyle: normal15Style,
      keyboardType: TextInputType.text,
      onSubmitted: widget.onSubmitted,
      isVisible: true,
      suffixWidget: _buildClearButton(),
    );
  }

  Widget _buildClearButton() {
    return CupertinoButton(
      child: Icon(
        Icons.clear_rounded,
        size: 14,
        color: searchClearButtonColor,
      ),
      onPressed: () {
        setState(() {
          controller.text = '';
        });
      },
    );
  }
}
