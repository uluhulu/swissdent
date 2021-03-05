import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/data/sign_in/interactor/sign_in_interactor.dart';
import 'package:swissdent/di.dart';
import 'package:swissdent/screens/get_code_screen/bloc/get_code_screen_event.dart';
import 'package:swissdent/screens/get_code_screen/widget/restore_code_title.dart';
import 'package:swissdent/screens/registration_screen/registration_screen.dart';
import 'package:swissdent/screens/restore_screen/restore_screen.dart';
import 'package:swissdent/util/mask_formatter.dart';
import 'package:swissdent/util/route_builder.dart';
import 'package:swissdent/widget/registration_background/gradient_background.dart';
import 'package:swissdent/screens/get_code_screen/widget/registration_countdown.dart';
import 'package:swissdent/screens/get_code_screen/widget/registration_description.dart';
import 'package:swissdent/screens/get_code_screen/widget/registration_terms_of_use_text.dart';
import 'package:swissdent/screens/get_code_screen/widget/registration_title.dart';
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
  FocusNode phone;
  FocusNode smsCode;

  GetCodeScreenBloc bloc;

  TextEditingController numberController;

  final formatter = MaskTextInputFormatter(
    mask: '$numPrefix ### ### ## ##',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phone = FocusNode();
    smsCode = FocusNode();
    initBloc();
    initNumberController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phone.dispose();
    smsCode.dispose();
  }

  void initBloc() {
    bloc = GetCodeScreenBloc(
      signInInteractor: getIt<SignInInteractor>(),
    );
  }

  void initNumberController() {
    numberController =
        TextEditingController(text: formatter.maskText('$numPrefix${''}'));
    numberController.addListener(() {
      sendTypeNumberEvent(formatter.unmaskText(numberController.text));
      if (numberController.text.isEmpty) {
        numberController.value = numberController.value.copyWith(
          text: numPrefix,
          selection: TextSelection.fromPosition(
            TextPosition(offset: numPrefix.length),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return bloc;
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
                child: _buildBody(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocConsumer<GetCodeScreenBloc, GetCodeScreenState>(
      listener: (BuildContext context, state) {
        if (state is NavigateNextRegistrationScreenState) {
          _navigateToNextRegistrationScreen(state.phoneNumber);
        }
        if (state is NavigateRestoreScreenState) {
          _navigateToRestoreScreen(context);
        }

        if (state is ErrorCodeState) {
          _showErrorSnackBar(context, state.errorMessage);
        }
      },
      builder: (BuildContext context, state) {
        return Column(
          children: [
            _buildRegistrationTitle(),
            _buildTextFields(context, state),
            _buildRegistrationCountDown(context, state),
            if (state.nextButtonIsVisible)
              _buildNextButton(context, state)
            else
              _buildGetCodeButton(context, state),
            _buildNavigateRestoreScreenTitle(context, state),
            _buildTermsOfUseTitle(context, state),
          ],
        );
      },
    );
  }

  Widget _buildRegistrationTitle() {
    return Column(
      children: [
        SizedBox(height: 124),
        RegistrationTitle(),
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23.0),
          child: RegistrationDescription(),
        ),
        SizedBox(height: 80),
      ],
    );
  }

  Widget _buildTextFields(BuildContext context, state) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: SwissdentNumTextField(
            defaultText: state.phoneNumber,
            focusNode: phone,
            // customController: numberController,
            onSubmitted: (text) {
              onSubmitted(context, smsCode);
            },
            onNumberType: (text) {
              sendTypeNumberEvent("$text");
            },
          ),
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: SwissdentSmsCodeTextField(
            focusNode: smsCode,
            onSubmitted: (text) {
              onSubmitted(context, smsCode);
            },
            isVisible: state.smsCodeIsAvaliable,
            onCodeType: (text) {
              sendTypeSmsCodeEvent(context, "$text");
            },
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }

  Widget _buildRegistrationCountDown(BuildContext context, state) {
    return Column(
      children: [
        Opacity(
          opacity: state.timerAvaliable ? 1 : 0,
          child: RegistrationCountdown(timerCount: state.seconds),
        ),
        SizedBox(height: 11),
      ],
    );
  }

  Widget _buildNextButton(BuildContext context, state) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 102.0),
          child: SwissdentButton(
            width: 170,
            buttonColor: codeButtonColor,
            buttonText: Text(
              goNextText,
              style: semiBold17WhiteStyle,
            ),
            isAvaliable: state.nextButtonIsVisible,
            onTap: () {
              sendConfirmCodeEvent(context);
            },
          ),
        )
      ],
    );
  }

  Widget _buildGetCodeButton(BuildContext context, state) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 102.0),
          child: SwissdentButton(
            width: 170,
            buttonColor: codeButtonColor,
            buttonText: Text(getCodeText, style: semiBold17WhiteStyle),
            isAvaliable: state.getCodeButtonIsAvaliable,
            onTap: () {
              sendGetCodeEvent(context);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNavigateRestoreScreenTitle(BuildContext context, state) {
    return Column(
      children: [
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: RestoreCodeTitle(
            onTap: () {
              sendNavigateRestoreScreenEvent(context);
            },
          ),
        ),
        SizedBox(height: 80),
      ],
    );
  }

  Widget _buildTermsOfUseTitle(BuildContext context, state) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: RegistrationTermsOfUseText(),
        ),
        SizedBox(
          height: 152,
        )
      ],
    );
  }

  void onSubmitted(BuildContext context, FocusNode nextFocus) {
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void sendTypeNumberEvent(
    String number,
  ) {
    bloc.add(
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

  void sendConfirmCodeEvent(
    BuildContext context,
  ) {
    BlocProvider.of<GetCodeScreenBloc>(context).add(ConfirmCodeEvent());
  }

  void sendNavigateRestoreScreenEvent(
    BuildContext context,
  ) {
    BlocProvider.of<GetCodeScreenBloc>(context)
        .add(NavigateRestoreScreenEvent());
  }

  void _navigateToNextRegistrationScreen(String phoneNumber) {
    ///confirm code event
    Navigator.of(context).pushAndRemoveUntil(
        buildRoute(
          RegistrationScreen(
            phoneNumber: phoneNumber,
          ),
        ),
        (route) => false);
  }

  void _showErrorSnackBar(BuildContext context, String errorMessage) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        backgroundColor: errorSnackbarColor,
        content: Text(
          errorMessage,
          style: semiBold17WhiteStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void _navigateToRestoreScreen(
    BuildContext context,
  ) async {
    ///confirm code event
    final phoneNumber = await Navigator.of(context).push<String>(
      buildRoute<String>(
        RestoreScreen(),
      ),
    );

    BlocProvider.of<GetCodeScreenBloc>(context).add(
      PhoneUpdateEvent(phoneNumber),
    );
  }
}
