import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/mocks.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/screens/team_screen/widget/doctor_card/doctor_card.dart';
import 'package:swissdent/screens/team_screen/widget/team_group_photo_banner.dart';
import 'package:swissdent/widget/appbar.dart';

///team screen
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=12%3A1206
class TeamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: buildAppbar(
        titleText: team,
        onBackCallback: () => Navigator.of(context).pop(),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView(
      children: _generateTeam(),
    );
  }

  List<Widget> _generateTeam() {
    final teamList = <Widget>[];
    teamList.add(TeamGroupPhotoBanner());
    for (int i = 0; i < doctorsInfo.length; i++) {
      final doctor = doctorsInfo[i];
      teamList.add(DoctorCard(
        photoPath: doctor.photoPath,
        doctorName: doctor.doctorName,
        doctorSubtitle: doctor.doctorSubtitle,
        doctorSpecialization: doctor.doctorSpecialization,
        doctorDescription: doctor.doctorDescription,
      ));
    }
    return teamList;
  }
}
