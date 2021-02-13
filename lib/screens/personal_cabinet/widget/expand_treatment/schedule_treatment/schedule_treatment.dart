import 'package:flutter/material.dart';
import 'package:swissdent/constants/mocks.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/base/expand_treatment.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/schedule_treatment/widget/stage/stage.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/schedule_treatment/widget/stage_orthopedic_card/stage_orhtopedic_card.dart';

/// schedule treatment expand
/// todo figma link
class ScheduleTreatment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandTreatment(
      cardName: scheduleTreatmentCardName,
      expandableBody: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stage(stageNum: 1),
          StageOrthopedicCard(
            surgialTemplateList: surgicalTemplateMockList,
          ),
        ],
      ),
    );
  }
}
