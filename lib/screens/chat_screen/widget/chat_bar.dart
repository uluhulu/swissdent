import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/widget/swissdent_textfield/swissdent_default_textfield.dart';

///chat bar on bottom screen
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=12%3A1487
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
              maxLines: 10,
              keyboardType: TextInputType.multiline,
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
