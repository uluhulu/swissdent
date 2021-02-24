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
/// https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=0%3A1
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
            StagePreventiveCard(doctorName: "Семенкова"),
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
