import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swissdent/constants/paths.dart';

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
      onPressed: onTap,
    );
  }
}
