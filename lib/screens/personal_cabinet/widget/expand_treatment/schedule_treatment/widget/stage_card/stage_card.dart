import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/schedule_treatment/widget/separator.dart';

///base card for stage of treatment
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=17%3A1255
class StageCard extends StatelessWidget {
  ///title of card
  final String title;

  ///subtitle of card
  final String subTitle;

  ///body of card
  final Widget body;

  const StageCard({
    Key key,
    this.title,
    this.subTitle,
    this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          width: 1,
          color: stageCardBorderColor,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            SizedBox(height: 16),
            _buildSubTitle(),
            _buildSeparator(),
            SizedBox(height: 16),
            _buildBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      title,
      style: bold18Black,
    );
  }

  Widget _buildSubTitle() {
    if (subTitle != null) {
      return Column(
        children: [
          Text(
            subTitle,
            style: bold14Style,
          ),
          SizedBox(height: 16),
        ],
      );
    }
    return SizedBox();
  }

  Widget _buildSeparator() {
    return Separator();
  }

  Widget _buildBody() {
    return body;
  }
}
