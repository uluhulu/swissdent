import 'package:flutter/material.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/screens/main_menu_screen/widget/app_bar_wave_decoration.dart';
import 'package:swissdent/widget/registration_background/gradient_background.dart';

///main menu app bar
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=3%3A2715
class MainMenuAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 133,
      child: Stack(
        children: [
          GradientBackground(),
          AppBarWaveDecoration(),
          Center(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Spacer(),
                  SizedBox(width: 32),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 11),
                    child: Text(
                      mainMenu,
                      style: semiBold17BlackStyle,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: 10,
                        right: 16,
                      ),
                      child: Image.asset(
                        iconChat,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
