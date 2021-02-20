import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/schedule_treatment/widget/separator.dart';

///base card for stage of treatment
///todo figma link
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
