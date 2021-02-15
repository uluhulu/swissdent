import 'package:flutter/material.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/widget/circle_avatar.dart';

///user info widget
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=3%3A2715
class UserInfo extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String avatarPath;

  const UserInfo({
    Key key,
    this.userName,
    this.userEmail,
    this.avatarPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 60,
          height: 60,
          child: RoundedAvatar(photoPath: avatarPath),
        ),
        SizedBox(width: 16),
        _buildUserInfo(),
      ],
    );
  }

  Widget _buildUserInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          userName,
          style: bold17BlackStyle,
        ),
        Text(
          userEmail,
          style: normal15StyleGrey,
        ),
      ],
    );
  }
}
