import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/screens/team_screen/widget/doctor_card/widget/doctor_%20specialization.dart';
import 'package:swissdent/screens/team_screen/widget/doctor_card/widget/doctor_decription.dart';
import 'package:swissdent/screens/team_screen/widget/doctor_card/widget/doctor_experience.dart';
import 'package:swissdent/screens/team_screen/widget/doctor_card/widget/doctor_name.dart';
import 'package:swissdent/screens/team_screen/widget/doctor_card/widget/doctor_photo.dart';
import 'package:swissdent/screens/team_screen/widget/doctor_card/widget/doctor_subtitle.dart';

///doctor card
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=12%3A1206
class DoctorCard extends StatelessWidget {
  final String photoPath;
  final String doctorName;
  final String doctorSubtitle;
  final String doctorSpecialization;
  final String doctorExperience;
  final String doctorDescription;



  const DoctorCard(
      {Key key, this.photoPath, this.doctorName, this.doctorSubtitle, this.doctorSpecialization, this.doctorExperience, this.doctorDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            color: teamCardColor,
            borderRadius: BorderRadius.all(
              Radius.circular(14),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 7),
                blurRadius: 15,
                color: userCardShadowColor.withOpacity(0.01),
              ),
            ]),
        child: _buildCardInfo(),
      ),
    );
  }

  Widget _buildCardInfo() {
    return Column(
      children: [
        DoctorPhoto(
          photoPath: photoPath,
        ),
        DoctorName(doctorName: doctorName),
        DoctorSubtitle(
          doctorSubtitle: doctorSubtitle,
        ),
        _buildSeparator(),
        DoctorSpecialization(doctorSpecialization: doctorSpecialization ),
        DoctorExperience( doctorExperience: doctorExperience),
        _buildSeparator(),
        DoctorDescription(doctorDescription:doctorDescription ,),
      ],
    );
  }

  Widget _buildSeparator() {
    return Padding(
      padding: const EdgeInsets.only(bottom : 16.0, left: 16, right: 16),
      child: Container(
        width: double.infinity,
        height: 1,
        color: doctorCardColor,
      ),
    );
  }
}
