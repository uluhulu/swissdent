import 'package:flutter/material.dart';
import 'package:swissdent/constants/styles.dart';

class DoctorSubtitle extends StatelessWidget {
  final String doctorSubtitle;

  const DoctorSubtitle({Key key, this.doctorSubtitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left : 16.0, bottom: 16, right: 16),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          doctorSubtitle,
          style: normal17BlueStyle,
        ),
      ),
    );
  }
}
