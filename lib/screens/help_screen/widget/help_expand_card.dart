import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/widget/expandable/expand_with_header.dart';

///https://www.figma.com/file/sw9XeUaCK0EN7jQ5ZzsFne/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F-(Copy)?node-id=12%3A2056
class HelpExpandCard extends StatelessWidget {
  final String title;
  final String bodyText;

  const HelpExpandCard(
      {Key key,
      this.title,
      this.bodyText,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      child: ExpandWithHeader(
        cardName: title,
        expandableBody: _buildBody(),
        headerStyle: bold16StyleBlack,
        icon: Image.asset(
          iconCartArrow,
          width: 12.27,
          height: 20.66,
        ),
        onCollapseListener: () {},
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 8.0, right: 16.0, bottom: 14.0, left: 16),
      child: Text(
        bodyText,
        style: normal15StyleGrey,
      ),
    );
  }
}
