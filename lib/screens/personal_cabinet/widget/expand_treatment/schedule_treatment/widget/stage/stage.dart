import 'package:flutter/material.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';

///stage of treatment expand
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=17%3A1255
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
        style: bold18Grey,
      ),
    );
  }
}
