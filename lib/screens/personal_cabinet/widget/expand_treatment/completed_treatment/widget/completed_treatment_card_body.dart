import 'package:flutter/material.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/base/treatment_date.dart';
import 'package:swissdent/util/money_formatter.dart';

///Completed Treatmen tCard Body
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=17%3A1255
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
      style: bold18Black,
    );
  }

  Widget _buildTreatmentCost() {
    return Text(
      '${formatMoney(treatmentCost)}',
      style: normal15StyleGrey5,
    );
  }
}
