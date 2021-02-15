import 'package:flutter/material.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/screens/user_profile_screen/widget/user_profile_photo.dart';
import 'package:swissdent/widget/appbar.dart';
import 'package:swissdent/widget/chat_button.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(
        titleText: userProfileTitle,
        onBackCallback: () => Navigator.of(context).pop(),
        action: ChatButton(),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody(){
    return Column(
      children: [
        UserProfilePhoto(),
      ],
    );
  }
}
