import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

///Personal cabinet screen
///todo link on figma
class PersonalCabinetScreen extends StatefulWidget {
  @override
  _PersonalCabinetScreenState createState() => _PersonalCabinetScreenState();
}

class _PersonalCabinetScreenState extends State<PersonalCabinetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: Column(),
    );
  }

  PreferredSizeWidget _buildAppbar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: backLeadingButtonColor,
        ),
        onPressed: () {
          ///todo go back
        },
      ),
    );
  }
}
