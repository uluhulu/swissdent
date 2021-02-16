import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';

class DoctorPhoto extends StatelessWidget {
  final String photoPath;

  const DoctorPhoto({Key key, this.photoPath}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        alignment: Alignment.center,
        width: 312,
        height: 314,
        decoration: BoxDecoration(
          color: teamCardColor,
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
        ),
        child: ClipRRect(
          borderRadius:BorderRadius.all(
            Radius.circular(14),
          ),
          child: Image.asset(
            photoPath,
          ),
        ),
      ),
    );
  }
}
