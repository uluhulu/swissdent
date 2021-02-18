import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/screens/help_screen/widget/help_background_wave.dart';
import 'package:swissdent/screens/help_screen/widget/help_expand_card.dart';
import 'package:swissdent/screens/help_screen/widget/help_question_expand_card.dart';
import 'package:swissdent/widget/appbar.dart';
import 'package:swissdent/widget/registration_background/registration_wave.dart';
import 'package:swissdent/widget/swissdent_button.dart';

import 'widget/help_screen_background.dart';
///help screen
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=12%3A1786
class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(
        titleText:healpAppBar,
        onBackCallback: () => Navigator.of(context).pop(),
      ),
      body: _buildBody(),
    );
  }
  Widget _buildBody(){
    return Stack(
      children: [
        HelpScreenBackground(),
        HelpBackgroundWave(),
        _buildExpandCards(),
        ]
    );
  }

  Widget _buildExpandCards(){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Column(
          children: [
            HelpExpandCard(
              title: toothpasteQuestion,
              bodyText: 'Какую пасту лучше выбрать после лечения?',
            ),
            HelpExpandCard(
              title: 'Как можно купить товар?',
              bodyText: 'Как можно купить товар?',
            ),
            HelpExpandCard(
              title: 'С какими страховыми компаниями работает клиника',
              bodyText: 'Альфа Страхование\nСогаз\nВСК\nЭнергогарант Челябинск\nЭнергогарант Магнитогорск\nРосгосстрах\nАстра Металл\nАВП РУС',
            ),
            HelpQuestionExpandCard(title: 'Напишите свой вопрос',),

            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 71),
              child: SwissdentButton(
                isAvaliable: true,
                buttonColor: emergencyCallButtonColor,
                width: double.infinity,
                buttonText: Text(emergencyCallButton, style: semiBold17WhiteStyle,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
