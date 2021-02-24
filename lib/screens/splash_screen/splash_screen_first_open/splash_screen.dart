import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/data/sign_in/interactor/sign_in_interactor.dart';
import 'package:swissdent/di.dart';
import 'package:swissdent/screens/get_code_screen/get_code_screen.dart';
import 'package:swissdent/screens/splash_screen/splash_screen_first_open/bloc/splash_screen_bloc.dart';
import 'package:swissdent/screens/splash_screen/splash_screen_first_open/bloc/splash_screen_state.dart';
import 'package:swissdent/screens/splash_screen/widget/splash_logo.dart';
import 'package:swissdent/screens/splash_screen/widget/splash_wave.dart';
import 'package:swissdent/util/route_builder.dart';

/// Splash screen
/// https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=1%3A5
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // testSignIn();
  }

  testSignIn() {
    final interactor = getIt<SignInInteractor>();
    final number = '+7(982)746-51-21';

    interactor.register(number).then((confirmCode) {
      print("ответ по регистрации ${confirmCode.toJson()}");
      interactor.confirmCode(number, confirmCode.code).then((value) {
        print("номер подтвержден? $value ");
        interactor.authorization(number, confirmCode.code).then((value) {
          print("ответ по авторизации ${value.toJson()}");
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return SplashScreenBloc();
      },
      child: BlocListener<SplashScreenBloc, SplashScreenState>(
        listener: (context, state) {
          if (state is SplashNavigateState) {
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
        SplashLogo(
          imageWidth: 170,
          imageHeight: 154,
          textWidth: 195,
          textHeight: 48,
          sizedBoxHeight: 25.85,
          offset: -100,
        ),
      ],
    );
  }

  void _navigateToRegistrationScreen() {
    Navigator.of(context)
        .pushAndRemoveUntil(buildRoute(GetCodeScreen()), (route) => false);
  }
}
