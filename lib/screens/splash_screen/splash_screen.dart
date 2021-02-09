import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/screens/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:swissdent/screens/splash_screen/widget/splash_logo.dart';
import 'package:swissdent/screens/splash_screen/widget/splash_wave.dart';
import 'package:swissdent/util/route_builder.dart';

import 'bloc/splash_screen_state.dart';

/// Splash screen
/// https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=1%3A5
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return SplashScreenBloc();
      },
      child: BlocListener(
        listener: (context, state) {
          if (state is NavigateRegistrationScreenState) {
            _navigateToRegistrationScreen();
          }
        },
        child: Scaffold(
          backgroundColor: splashBackgroundColor,
          body: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        SplashWave(),
        SplashLogo(),
      ],
    );
  }

  void _navigateToRegistrationScreen() {
    Navigator.of(context).pushAndRemoveUntil(
      buildRoute(
        Container(),
      ),
      (route) => false,
    );
  }
}
