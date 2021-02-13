import 'package:flutter/material.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/base/treatment_date.dart';
import 'package:swissdent/util/money_formatter.dart';

///preventive template
///todo figma link
class PreventiveTemplate extends StatelessWidget {
  ///date time of preventive
  final DateTime dateTime;

  ///name of preventive
  final String preventiveName;

  ///preventive description
  final String preventiveDescription;

  ///preventive cost
  final double totalCost;

  PreventiveTemplate({
    Key key,
    this.dateTime,
    this.preventiveName,
    this.preventiveDescription,
    this.totalCost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDate(),
        SizedBox(height: 16),
        _buidTitle(),
        SizedBox(height: 16),
        _buildDescription(),
        SizedBox(height: 16),
        _buildCost(),
      ],
    );
  }

  Widget _buildDate() {
    return TreatmentDate(treatmentDate: dateTime);
  }

  Widget _buidTitle() {
    return Text(
      preventiveName,
      style: normal16StyleBlack600,
    );
  }

  Widget _buildDescription() {
    return Text(
      preventiveDescription,
      style: normal15Style,
    );
  }

  Widget _buildCost() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          totalCostColumnName,
          style: normal10Style,
        ),
        SizedBox(height: 8),
        Text(
          formatMoney(totalCost),
          style: normal15Style,
        ),
      ],
    );
  }
}
