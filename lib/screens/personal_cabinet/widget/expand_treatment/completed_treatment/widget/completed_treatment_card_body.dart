import 'package:flutter/material.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/base/treatment_date.dart';

///Completed Treatmen tCard Body
///todo figma link
class CompletedTreatmentCardBody extends StatelessWidget {
  ///date of treatment
  final DateTime treatmentDate;

  ///name of treatment
  final String treatmentName;

  ///cost of treatment
  final double treatmentCost;

  const CompletedTreatmentCardBody({
    Key key,
    this.treatmentDate,
    this.treatmentName,
    this.treatmentCost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTreatmentDate(),
        SizedBox(height: 16),
        _buildTreatmentName(),
        SizedBox(height: 8),
        _buildTreatmentCost(),
      ],
    );
  }

  Widget _buildTreatmentDate() {
    return TreatmentDate(treatmentDate: treatmentDate);
  }

  Widget _buildTreatmentName() {
    return Text(
      treatmentName,
      style: bold18BlackStyle,
    );
  }

  Widget _buildTreatmentCost() {
    return Text(
      '$treatmentCost',
      style: normal15StyleGrey5,
    );
  }
}
