import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/screens/main_menu_screen/main_menu_screen.dart';
import 'package:swissdent/screens/splash_screen/splash_screen_registration/widget/splash_screen_registration_text.dart';
import 'package:swissdent/screens/splash_screen/widget/splash_logo.dart';
import 'package:swissdent/screens/splash_screen/widget/splash_wave.dart';
import 'package:swissdent/util/route_builder.dart';

///splash screen registration
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=3%3A2692
class SplashScreenRegistration extends StatefulWidget {
  @override
  _SplashScreenRegistrationState createState() =>
      _SplashScreenRegistrationState();
}

class _SplashScreenRegistrationState extends State<SplashScreenRegistration> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initNavigationTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashBackgroundColor,
      body: GestureDetector(onTap: () => navigateNext(), child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        SplashWave(),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SplashLogo(
                imageWidth: 92.43,
                imageHeight: 83.59,
                textWidth: 106,
                textHeight: 26.41,
                sizedBoxHeight: 14,
                offset: 99,
              ),
              SizedBox(
                height: 188,
              ),
              SplashScreenRegistrationText(),
            ],
          ),
        ),
      ],
    );
  }

  void initNavigationTimer() async {
    await Future.delayed(Duration(seconds: 3));
    navigateNext();
  }

  void navigateNext() {
    Navigator.of(context).pushAndRemoveUntil(
      buildRoute(MainMenuScreen()),
      (route) => false,
    );
  }
}
