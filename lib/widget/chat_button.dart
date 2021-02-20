import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/screens/chat_screen/chat_screen.dart';
import 'package:swissdent/util/route_builder.dart';

///chat button
///todo figma link
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
