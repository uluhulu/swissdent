import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/schedule_treatment/widget/separator.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/schedule_treatment/widget/stage_card/stage_card.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/schedule_treatment/widget/stage_orthopedic_card/widget/surgical_template/surgical_template.dart';

///Stage orthopedic card
/// https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=17%3A1255
class StageOrthopedicCard extends StatelessWidget {
  ///surgial templates of orhopedic card
  final List<SurgicalTemplate> surgialTemplateList;

  const StageOrthopedicCard({Key key, this.surgialTemplateList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StageCard(
      title: orhopedicStageCardTitle,
      body: Column(
        children: _buildTemplates(),
      ),
    );
  }

  List<Widget> _buildTemplates() {
    final templateList = <Widget>[];
    for (var index = 0; index < surgialTemplateList.length; index++) {
      final template = surgialTemplateList[index];
      templateList.add(template);

      if (index != surgialTemplateList.length - 1) {
        templateList.add(Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Separator(),
        ));
      }
    }
    return templateList;
  }
}
