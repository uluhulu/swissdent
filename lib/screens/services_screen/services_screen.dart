import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/screens/services_screen/widget/player/player.dart';
import 'package:swissdent/screens/services_screen/widget/service_expand.dart';
import 'package:swissdent/widget/expandable/expand_with_header.dart';
import 'package:swissdent/widget/appbar.dart';
import 'package:swissdent/widget/chat_button.dart';

///screen for services
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=169%3A279
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
        onBackCallback: () {
          goBack();
        },
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
        SizedBox(height: 12),
        ServiceExpand(
          title: "Терапия",
          videoUrl:
              'https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4',
        ),
      ],
    );
  }

  void goBack() {
    Navigator.of(context).pop();
  }
}
