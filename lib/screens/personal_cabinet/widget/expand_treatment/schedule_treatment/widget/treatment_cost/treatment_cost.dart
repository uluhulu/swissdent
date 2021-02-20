import 'package:flutter/material.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/util/money_formatter.dart';

///Treatment cost
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=17%3A1255
class TreatmentCost extends StatelessWidget {
  ///cost of treatment
  final double treatmentCost;

  /// discount of treatment
  final double treatmentDiscountCost;

  const TreatmentCost({
    Key key,
    this.treatmentCost,
    this.treatmentDiscountCost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Row(
        children: [
          _buildColumn(treatmentCostTitle, treatmentCost),
          SizedBox(width: 58),
          _buildColumn(treatmentDiscountTitle, treatmentDiscountCost),
        ],
      ),
    );
  }

  Widget _buildColumn(
    String columnName,
    double cost,
  ) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(columnName, style: normal15StyleGrey),
          SizedBox(height: 16),
          Text(
            '${formatMoney(cost)} $rubPrefix',
            style: bold18Black,
          ),
        ],
      ),
    );
  }
}
