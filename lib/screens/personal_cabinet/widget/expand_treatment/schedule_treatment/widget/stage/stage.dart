import 'package:flutter/material.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';

///stage of treatment expand
///todo figma link
class Stage extends StatelessWidget {
  ///num of stage
  final int stageNum;

  const Stage({
    Key key,
    this.stageNum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15.0,
        bottom: 24,
      ),
      child: Text(
        '$stageTitle$stageNum',
        style: bold18BlackGrey,
      ),
    );
  }
}
