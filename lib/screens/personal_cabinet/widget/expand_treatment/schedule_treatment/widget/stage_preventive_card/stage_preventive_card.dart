import 'package:flutter/material.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/schedule_treatment/widget/stage_card/stage_card.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/schedule_treatment/widget/stage_preventive_card/widget/preventive_template.dart';

///stage preventive card
///todo figma design
class StagePreventiveCard extends StatelessWidget {
  ///name of preventive doctor
  final String doctorName;

  const StagePreventiveCard({
    Key key,
    this.doctorName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StageCard(
      title: preventiveStageCardTitle,
      subTitle: '$preventiveStageCardSubtitle$doctorName',

      ///todo remove mock data
      body: PreventiveTemplate(
        dateTime: DateTime.now(),
        preventiveName: "Комплекс профессиональной гигиены",
        preventiveDescription:
            'Перед хирургическим этапом и после необходи прием у ортопеда для снитяи и фиксации конструкций',
        totalCost: 4200,
      ),
    );
  }
}
