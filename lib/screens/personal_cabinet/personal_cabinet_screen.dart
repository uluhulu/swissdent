import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swissdent/constants/mocks.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/completed_treatment/complete_treatment.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/schedule_treatment/schedule_treatment.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/schedule_treatment/widget/stage_orthopedic_card/stage_orhtopedic_card.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/schedule_treatment/widget/stage_orthopedic_card/widget/surgical_template/surgical_template.dart';

import '../../constants/colors.dart';

///Personal cabinet screen
///todo link on figma
class PersonalCabinetScreen extends StatefulWidget {
  @override
  _PersonalCabinetScreenState createState() => _PersonalCabinetScreenState();
}

class _PersonalCabinetScreenState extends State<PersonalCabinetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: ListView(
        children: [
          CompleteTreatment(
            treatmentDate: DateTime.now(),
            treatmentName: "Массаж простаты",
            treatmentCost: 999.00,
          ),
          ScheduleTreatment(
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppbar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: backLeadingButtonColor,
        ),
        onPressed: () {
          ///todo go back
        },
      ),
    );
  }
}
