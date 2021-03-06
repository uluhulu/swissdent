import 'package:flutter/material.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/base/treatment_date.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/schedule_treatment/widget/stage_orthopedic_card/widget/surgical_template/widget/surgical_table.dart';

///SurgicalTemplate is part of orthopedic stage
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=17%3A1255
class SurgicalTemplate extends StatelessWidget {
  /// date of operation
  final DateTime operationDate;

  /// name of operation
  final String operationName;

  /// list of teeths
  final List<String> teethsList;

  /// total cost of operation
  final double totalCost;

  /// date is red
  final bool isDateRed;

  const SurgicalTemplate({
    Key key,
    this.operationDate,
    this.operationName,
    this.teethsList,
    this.totalCost,
    this.isDateRed = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildOperationDate(),
        SizedBox(height: 16),
        _buildoperationName(),
        SizedBox(height: 35),
        _buildSurgicalTable(),
      ],
    );
  }

  Widget _buildOperationDate() {
    return TreatmentDate(
      treatmentDate: operationDate,
      isDateRed: isDateRed,
    );
  }

  Widget _buildoperationName() {
    return Text(
      operationName,
      style: normal16StyleBlack600,
    );
  }

  Widget _buildSurgicalTable() {
    return SurgicalTable(
      teethsCount: teethsList.length,
      teethsList: teethsList,
      totalCost: totalCost,
    );
  }
}
