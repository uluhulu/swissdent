import 'package:flutter/material.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';

class DoctorSpecialization extends StatelessWidget {
  final String doctorSpecialization;

  const DoctorSpecialization({Key key, this.doctorSpecialization}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 8, right: 16),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              specialization,
              style: bold15StyleBlack,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 16, right: 16),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              doctorSpecialization,
              style: normal15StyleGrey1,
            ),
          ),
        ),
      ],
    );
  }
}
