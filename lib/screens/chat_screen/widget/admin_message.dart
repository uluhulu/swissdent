import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/widget/circle_avatar.dart';

///message item of admin
///todo figma link
class AdminMessage extends StatelessWidget {
  ///user image path
  final String photoPath;

  ///user message date
  final DateTime messageDate;

  ///text of message
  final String messageText;

  /// name of admin
  final String adminName;

  ///position of admin
  final String adminPosition;

  const AdminMessage({
    Key key,
    this.photoPath,
    this.messageDate,
    this.messageText,
    this.adminName,
    this.adminPosition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildLogo(),
        SizedBox(width: 8),
        _buildNameAndDate(),
      ],
    );
  }

  Widget _buildNameAndDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          adminName,
          style: bold15StyleBlack,
        ),
        Text(
          '$adminPosition ${messageDate.day}.${messageDate.month}.${messageDate.year} ${messageDate.hour}.${messageDate.minute}',
          style: normal12StyleGrey2,
        ),
      ],
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 37,
      height: 37,
      child: RoundedAvatar(
        photoPath: 'https://lh3.googleusercontent.com/proxy/1c9MCxFivkYAMKwAmTajTIRTN78LGSI3qXOljpX39V_NSyqJEO3sY0I0FM-YdDCGODzp7HjU-dhUYeJJEE6Cszk_O-02mcLikNIYsDevrIpgRHiFBH12rhRs-3c2NWS731NVeVbbn9yt_aDYiv7t10_p-rqJIVN_nESTQes7GZAUdQ',
      ),
    );
  }

  Widget _buildMessage() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: adminMessageColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(14),
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

