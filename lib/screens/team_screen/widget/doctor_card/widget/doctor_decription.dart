import 'package:flutter/material.dart';
import 'package:swissdent/constants/styles.dart';

class DoctorDescription extends StatelessWidget {
  final String doctorDescription;

  const DoctorDescription({Key key, this.doctorDescription}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left : 16.0, bottom: 20, right: 16),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          doctorDescription,
          style: normal15StyleGrey,
        ),
      ),
    );
  }
}
