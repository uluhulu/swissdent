import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/widget/circle_avatar.dart';

///message item of current user
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=12%3A1487
class MeMessage extends StatelessWidget {
  ///user image path
  final String photoPath;

  ///user message date
  final DateTime messageDate;

  ///text of message
  final String messageText;

  const MeMessage({
    Key key,
    this.photoPath,
    this.messageDate,
    this.messageText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildMessageInfoRow(),
          SizedBox(height: 8),
          _buildMessage(),
        ],
      ),
    );
  }

  Widget _buildMessageInfoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildNameAndDate(),
        SizedBox(width: 8),
        _buildLogo(),
      ],
    );
  }

  Widget _buildNameAndDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          userMessageTitle,
          style: bold15StyleBlack,
        ),
        Text(
          '${messageDate.day}.${messageDate.month}.${messageDate.year} ${messageDate.hour}.${messageDate.minute}',
          style: normal12StyleGrey2,
        ),
      ],
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 37,
      height: 37,
      child: RoundedAvatar(),
    );
  }

  Widget _buildMessage() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: userMessageColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          bottomLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        ),
      ),
      child: Text(
        messageText,
        textAlign: TextAlign.start,
        style: normal15StyleGrey,
      ),
    );
  }
}
