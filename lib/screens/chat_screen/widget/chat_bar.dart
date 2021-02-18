import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/widget/swissdent_textfield/swissdent_default_textfield.dart';

///chat bar on bottom screen
///todo figma link
class ChatBar extends StatelessWidget {
  final Function(String message) onMessageSubmit;

  final TextEditingController controller = TextEditingController();

  ChatBar({
    Key key,
    this.onMessageSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
        left: 16,
        top: 16,
      ),
      child: Row(
        children: [
          Expanded(
            child: SwissdentDefaultTextField(
              hint: chatBarHint,
              customController: controller,
              onSubmitted: (text) {
                onMessageSubmit(controller.text);
                clearController();
              },
            ),
          ),
          CupertinoButton(
            onPressed: () {
              onMessageSubmit(controller.text);
              clearController();
            },
            child: Icon(
              Icons.send,
              color: sendButtonColor,
            ),
          ),
        ],
      ),
    );
  }

  void clearController() {
    controller.text = '';
  }
}
