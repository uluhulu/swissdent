import 'package:flutter/material.dart';
import 'package:swissdent/constants/mocks.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/widget/expandable/expand_without_header.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/schedule_treatment/widget/document/document.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/schedule_treatment/widget/stage/stage.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/schedule_treatment/widget/stage_orthopedic_card/stage_orhtopedic_card.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/schedule_treatment/widget/stage_preventive_card/stage_preventive_card.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/schedule_treatment/widget/treatment_cost/treatment_cost.dart';

/// schedule treatment expand
/// todo figma link
class ScheduleTreatment extends StatelessWidget {

  const ScheduleTreatment({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandWithoutHeader(
      cardName: scheduleTreatmentCardName,
      expandableBody: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stage(stageNum: 1),
            StageOrthopedicCard(
              surgialTemplateList: surgicalTemplateMockList,
            ),
            SizedBox(height: 32),
            StagePreventiveCard(doctorName: "Писечкина"),
            TreatmentCost(
              treatmentCost: 66000,
              treatmentDiscountCost: 30000,
            ),
            SizedBox(height: 67),
            Document(),
          ],
        ),
      ),
    );
  }
}
