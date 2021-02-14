import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/screens/get_code_screen/bloc/get_code_screen_event.dart';
import 'package:swissdent/widget/registration_background/gradient_background.dart';
import 'package:swissdent/screens/get_code_screen/widget/registration_countdown.dart';
import 'package:swissdent/screens/get_code_screen/widget/registration_description.dart';
import 'package:swissdent/screens/get_code_screen/widget/registration_terms_of_use_text.dart';
import 'package:swissdent/widget/registration_title/registration_title.dart';
import 'package:swissdent/widget/registration_background/registration_wave.dart';
import 'package:swissdent/widget/swissdent_button.dart';
import 'package:swissdent/widget/swissdent_textfield/swissdent_num_textfield.dart';
import 'package:swissdent/widget/swissdent_textfield/swissdent_sms_code_textfield.dart';

import 'bloc/get_code_screen_bloc.dart';
import 'bloc/get_code_screen_state.dart';

class GetCodeScreen extends StatefulWidget {
  @override
  _GetCodeScreenState createState() => _GetCodeScreenState();
}

class _GetCodeScreenState extends State<GetCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return GetCodeScreenBloc();
      },
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  GradientBackground(),
                  RegistrationWave(),
                ],
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: _buildBody(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<GetCodeScreenBloc, GetCodeScreenState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return Column(
          children: [
            RegistrationTitle(),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23.0),
              child: RegistrationDescription(),
            ),
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: SwissdentNumTextField(
                onNumberType: (text) {
                  sendTypeNumberEvent(context, "7$text");
                },
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: SwissdentSmsCodeTextField(
                isVisible: state.smsCodeIsAvaliable,
                onCodeType: (text) {
                  sendTypeSmsCodeEvent(context, "$text");
                },
              ),
            ),
            SizedBox(height: 8),
            Opacity(
              opacity: state.timerAvaliable ? 1 : 0,
              child: RegistrationCountdown(timerCount: state.seconds),
            ),
            SizedBox(height: 11),
            if (state.nextButtonIsVisible)
              SwissdentButton(
                buttonColor: codeButtonColor,
                buttonText: goNextText,
                isAvaliable: state.nextButtonIsVisible,
                onTap: () {
                  // sendGetCodeEvent(context);
                },
              )
            else
              SwissdentButton(
                buttonColor: codeButtonColor,
                buttonText: getCodeText,
                isAvaliable: state.getCodeButtonIsAvaliable,
                onTap: () {
                  sendGetCodeEvent(context);
                },
              ),
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: RegistrationTermsOfUseText(),
            ),
          ],
        );
      },
    );
  }

  void sendTypeNumberEvent(
    BuildContext context,
    String number,
  ) {
    BlocProvider.of<GetCodeScreenBloc>(context).add(
      TypeNumberEvent(number),
    );
  }

  void sendGetCodeEvent(
    BuildContext context,
  ) {
    BlocProvider.of<GetCodeScreenBloc>(context).add(
      GetCodeEvent(),
    );
  }

  void sendTypeSmsCodeEvent(
    BuildContext context,
    String code,
  ) {
    BlocProvider.of<GetCodeScreenBloc>(context).add(
      TypeSmsCodeEvent(code),
    );
  }
}
