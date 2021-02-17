import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/screens/help_screen/widget/question_info_board.dart';
import 'package:swissdent/widget/expandable/expand_with_header.dart';
import 'package:swissdent/widget/swissdent_button.dart';

class HelpQuestionExpandCard extends StatelessWidget {
  final String title;

  const HelpQuestionExpandCard({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      child: ExpandWithHeader(
        cardName: title,
        expandableBody: _buildBody(),
        headerStyle: bold16StyleBlack,
        isShowAnimation: false,
        icon: Image.asset(
          iconChat,
          width: 24,
        ),
        onCollapseListener: () {},
      ),
    );
  }
  Widget _buildBody() {
    return Column(
      children:[
        Padding(
        padding:
        const EdgeInsets.only(top: 33.0, right: 16.0, bottom: 16.0, left: 16),
        child: Container(
          width: 312,
          height: 115,
          decoration: BoxDecoration(
              border: Border.all(color: borderColor),
              borderRadius: BorderRadius.all(Radius.circular(16))
          ),
          child: Padding(
            padding: const EdgeInsets.only( left: 24, right: 24),
            child: TextField(
              maxLines: 10,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: userQuestion,
              ),
            ),
          ),
        ),
      ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0,bottom: 32.0),
          child: SwissdentButton(
            width: double.infinity,
            buttonText: Text(send, style: semiBold17WhiteStyle,),
            isAvaliable: true,
            buttonColor: codeButtonColor,
          ),
        ),
        QuestionInfoBoard(),
      ],
    );
  }
}
