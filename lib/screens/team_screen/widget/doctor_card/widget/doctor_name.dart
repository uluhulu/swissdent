import 'package:flutter/material.dart';
import 'package:swissdent/constants/styles.dart';

class DoctorName extends StatelessWidget {
  final String doctorName;

  const DoctorName({Key key, this.doctorName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left : 16.0, bottom: 8, right: 16),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          doctorName,
          style: bold20BlackStyle,
        ),
      ),
    );
  }
}
