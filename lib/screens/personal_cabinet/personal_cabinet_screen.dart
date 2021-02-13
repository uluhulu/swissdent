import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swissdent/constants/mocks.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/completed_treatment/complete_treatment.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/schedule_treatment/schedule_treatment.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/schedule_treatment/widget/stage_orthopedic_card/stage_orhtopedic_card.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/schedule_treatment/widget/stage_orthopedic_card/widget/surgical_template/surgical_template.dart';

import '../../constants/colors.dart';

///Personal cabinet screen
///todo link on figma
class PersonalCabinetScreen extends StatefulWidget {
  @override
  _PersonalCabinetScreenState createState() => _PersonalCabinetScreenState();
}

class _PersonalCabinetScreenState extends State<PersonalCabinetScreen> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        controller: scrollController,
        children: [
          SizedBox(height: 25),
          Image.asset(
            teethmapDemo,
            width: 352,
            height: 258,
          ),
          SizedBox(height: 90),
          CompleteTreatment(
            treatmentDate: DateTime.now(),
            treatmentName: "Массаж простаты",
            treatmentCost: 999.00,
          ),
          ScheduleTreatment(
            onExpandListener: () async{
              // await Future.delayed(Duration(milliseconds: 600));
              scrollController.animateTo(
                450,
                duration: Duration(milliseconds: 200),
                curve: Curves.linear,
              );
            },
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppbar() {
    return AppBar(
      backgroundColor: appbarColor,
      elevation: 0,
      title: Text(
        personalDocumentTitle,
        style: bold17BlackStyle,
      ),
      actions: [
        _buildJewsButton(),
      ],
      leading: CupertinoButton(
        onPressed: () {
          ///todo go back
        },
        child: Icon(
          Icons.arrow_back_ios_rounded,
          color: backLeadingButtonColor,
        ),
      ),
    );
  }

  Widget _buildJewsButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 50,
          height: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            image: DecorationImage(
              image: AssetImage(iconJews),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}
