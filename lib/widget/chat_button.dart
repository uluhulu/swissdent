import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/screens/chat_screen/chat_screen.dart';
import 'package:swissdent/util/route_builder.dart';

///chat button
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=3%3A2715
class ChatButton extends StatelessWidget {
  final VoidCallback onTap;

  const ChatButton({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Image.asset(
        iconChat,
        width: 24,
      ),
      onPressed: () => _navigateToChatScreen(context),
    );
  }
  void _navigateToChatScreen(BuildContext context) {
    Navigator.of(context).push(buildRoute(ChatScreen()));
  }
}
