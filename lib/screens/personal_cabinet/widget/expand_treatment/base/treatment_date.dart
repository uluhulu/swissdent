import 'package:flutter/material.dart';
import 'package:swissdent/constants/styles.dart';

///treatment date
///todo link figma
class TreatmentDate extends StatelessWidget {
  ///treatment date
  final DateTime treatmentDate;

  /// is date red color
  final bool isDateRed;

  const TreatmentDate({
    Key key,
    this.treatmentDate,
    this.isDateRed = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${treatmentDate.day}/${treatmentDate.month} ${treatmentDate.hour}:${treatmentDate.second}',
      style: isDateRed ? normal16StyleRed : normal16StyleBlue,
    );
  }
}
