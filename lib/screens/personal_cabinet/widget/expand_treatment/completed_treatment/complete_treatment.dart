import 'package:flutter/material.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/widget/expandable/expand_without_header.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/completed_treatment/widget/completed_treatment_card_body.dart';

///complete treatment expandable card
///link to figma
class CompleteTreatment extends StatelessWidget {
  ///date of treatment
  final DateTime treatmentDate;

  ///name of treatment
  final String treatmentName;

  ///cost of treatment
  final double treatmentCost;

  const CompleteTreatment({
    Key key,
    this.treatmentDate,
    this.treatmentName,
    this.treatmentCost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandWithoutHeader(
      cardName: completeTreatmentCardName,
      expandableBody: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CompletedTreatmentCardBody(
          treatmentDate: treatmentDate,
          treatmentName: treatmentName,
          treatmentCost: treatmentCost,
        ),
      ),
    );
  }
}
