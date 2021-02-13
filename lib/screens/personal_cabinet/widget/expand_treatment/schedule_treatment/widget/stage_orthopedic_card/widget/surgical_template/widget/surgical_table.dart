import 'package:flutter/material.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';

///surgical table
///todo link of figma
class SurgicalTable extends StatelessWidget {
  ///count of teeths
  final int teethsCount;

  ///list of teeths names
  final List<String> teethsList;

  final double totalCost;

  const SurgicalTable({
    Key key,
    this.teethsCount,
    this.teethsList,
    this.totalCost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildColumn(
            teethColumnName,
            teethsList.map((e) => e).toString(),
          ),
        ),
        SizedBox(width: 30),
        _buildColumn(
          teethCountColumnName,
          '$teethsCount',
        ),
        SizedBox(width: 30),
        _buildColumn(
          totalCostColumnName,
          '$totalCost',
        ),
      ],
    );
  }

  Widget _buildColumn(
    String columnName,
    String columnContent,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildColumnName(columnName),
        SizedBox(height: 6),
        _buildColumnContent(columnContent),
      ],
    );
  }

  Widget _buildColumnName(String columnName) {
    return Text(
      columnName,
      style: normal10Style,
    );
  }

  Widget _buildColumnContent(String columnContent) {
    return Text(
      columnContent,
      style: normal15Style,
    );
  }
}
