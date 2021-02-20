import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/screens/user_profile_screen/widget/user_profile_info.dart';
import 'package:swissdent/screens/user_profile_screen/widget/user_profile_photo.dart';
import 'package:swissdent/widget/appbar.dart';
import 'package:swissdent/widget/chat_button.dart';
import 'package:swissdent/widget/swissdent_button.dart';

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
    return SingleChildScrollView(
      child: Column(
        children: [
          UserProfilePhoto(),
          UserProfileInfo(),
          Padding(
            padding: const EdgeInsets.only(left:16.0, right: 16.0, top: 64, bottom: 47),
            child: SwissdentButton(
              width: double.infinity,
              isAvaliable: true,
              buttonText: Text(save, style: semiBold17WhiteStyle,),
              buttonColor: codeButtonColor,
            ),
          )
        ],
      ),
    );
  }
}
