import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/screens/services_screen/widget/player/player.dart';
import 'package:swissdent/screens/services_screen/widget/service_expand.dart';
import 'package:swissdent/screens/services_screen/widget/service_expand_card/service_expand_card.dart';
import 'package:swissdent/widget/appbar.dart';
import 'package:swissdent/widget/chat_button.dart';

///screen for services
///todo figma link
class ServicesScreen extends StatefulWidget {
  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: buildAppbar(
        titleText: servicesScreenTitle,
        action: ChatButton(
          onTap: () {},
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView(
      children: [
        ServiceExpand(
          title: "Терапия",
          videoUrl: 'https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4',
        ),
      ],
    );
  }
}
