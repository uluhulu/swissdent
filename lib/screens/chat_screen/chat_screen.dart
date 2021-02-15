import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/screens/chat_screen/widget/admin_message.dart';
import 'package:swissdent/screens/chat_screen/widget/chat_bar.dart';
import 'package:swissdent/screens/chat_screen/widget/me_message.dart';
import 'package:swissdent/widget/appbar.dart';

///screen chat
///todo figma link
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var mockMessages = <Widget>[
    AdminMessage(
      adminName: "Анна Иванова",
      adminPosition: "Администратор клиники",
      messageText: 'Добрый день. Чем мы можем вам помочь?',
      messageDate: DateTime.now(),
    ),
  ];

  final scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: buildAppbar(
        onBackCallback: () {},
        titleText: chatTitle,
      ),
      body: Stack(
        children: [
          _buildChatDecoration(),
          _buildChat(),
        ],
      ),
    );
  }

  Widget _buildChatDecoration() {
    return Image.asset(
      imgChatDecoration,
      width: 274,
      height: 503,
    );
  }

  Widget _buildChat() {
    return Column(
      children: [
        _buildChatList(),
        _buildChatBar(),
      ],
    );
  }

  Widget _buildChatList() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return mockMessages[index];
        },
        itemCount: mockMessages.length,
        controller: scrollController,
      ),
    );
  }

  Widget _buildChatBar() {
    return ChatBar(
      onMessageSubmit: (message) {
        setState(() {
          mockMessages.add(MeMessage(
            messageText: message,
            messageDate: DateTime.now(),
          ));
          Future.delayed(Duration(milliseconds: 50), () {
            scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              duration: Duration(milliseconds: 200),
              curve: Curves.easeIn,
            );
          });
        });
      },
    );
  }
}
