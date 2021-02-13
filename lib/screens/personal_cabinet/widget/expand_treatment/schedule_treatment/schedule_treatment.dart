import 'package:flutter/material.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/base/expand_treatment.dart';

/// schedule treatment expand
/// todo figma link
class ScheduleTreatment extends StatelessWidget {
  final Widget expandBody;

  const ScheduleTreatment({Key key, this.expandBody}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandTreatment(
      cardName: scheduleTreatmentCardName,
      expandableBody: expandBody,
    );
  }
}
