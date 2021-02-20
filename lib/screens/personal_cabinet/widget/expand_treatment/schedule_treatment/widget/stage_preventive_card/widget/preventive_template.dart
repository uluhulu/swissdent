import 'package:flutter/material.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/base/treatment_date.dart';
import 'package:swissdent/util/money_formatter.dart';

///preventive template
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=17%3A1255
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
