import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/data/sign_in/interactor/sign_in_interactor.dart';
import 'package:swissdent/di.dart';
import 'package:swissdent/screens/get_code_screen/get_code_screen.dart';
import 'package:swissdent/screens/log_in_screen/bloc/log_in_screen_bloc.dart';
import 'package:swissdent/screens/log_in_screen/bloc/log_in_screen_event.dart';
import 'package:swissdent/screens/log_in_screen/bloc/log_in_screen_state.dart';
import 'package:swissdent/screens/log_in_screen/widget/forget_password_title.dart';
import 'package:swissdent/screens/log_in_screen/widget/log_in_description.dart';
import 'package:swissdent/screens/log_in_screen/widget/log_in_title.dart';
import 'package:swissdent/screens/log_in_screen/widget/log_in_with_accounts_text.dart';
import 'package:swissdent/screens/log_in_screen/widget/navigate_to_registration_screen_title.dart';
import 'package:swissdent/screens/main_menu_screen/main_menu_screen.dart';
import 'package:swissdent/screens/registration_screen/widgets/registration_social_icon.dart';
import 'package:swissdent/screens/restore_screen/restore_screen.dart';
import 'package:swissdent/util/route_builder.dart';
import 'package:swissdent/widget/registration_background/gradient_background.dart';
import 'package:swissdent/widget/registration_background/registration_wave.dart';
import 'package:swissdent/widget/swissdent_button.dart';
import 'package:swissdent/widget/swissdent_textfield/swissdent_num_textfield.dart';
import 'package:swissdent/widget/swissdent_textfield/swissdent_password_textfield.dart';

///log in screen
class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  FocusNode phone;
  FocusNode password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phone = FocusNode();
    password = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LogInScreenBloc>(
      create: (BuildContext context) {
        return LogInScreenBloc(
          signInInteractor: getIt<SignInInteractor>(),
        );
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
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<LogInScreenBloc, LogInScreenState>(
      listener: (BuildContext context, state) {
        if (state is NavigateMainMenuScreenState) {
          _navigateToMainMenuScreen();
        }
        if (state is NavigateRegistrationScreenState) {
          _navigateToRegistrationScreen();
        }

        if (state is NavigateRestoreScreenState) {
          _navigateToRestoreScreen(context, state);
        }
      },
      builder: (BuildContext context, LogInScreenState state) {
        return Column(
          children: [
            _logInTitle(),
            _buildTextFields(context, state),
            _navigateToRegistrationScreenTitle(context),
            _buildSignInButton(context, state),
            _buildForgetPasswordTitle(context),
            _buildLogInWithAccountsTitle(),
            SizedBox(height: 24),
            _buildSocialMediaIcons(context),
            SizedBox(height: 32),
          ],
        );
      },
    );
  }

  Widget _logInTitle() {
    return Column(
      children: [
        SizedBox(height: 80),
        LogInTitle(),
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23.0),
          child: LogInDescription(),
        ),
      ],
    );
  }

  Widget _buildTextFields(BuildContext context, LogInScreenState state) {
    return Column(
      children: [
        SizedBox(height: 60),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: SwissdentNumTextField(
            defaultText: state.phoneNumber,
            focusNode: phone,
            onNumberType: (number) {
              sentTypeNumberEvent(context, number);
            },
            onSubmitted: (text) {
              onSubmitted(context, password);
            },
          ),
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: SwissdentPasswordField(
            focusNode: password,
            hintText: passwordText,
            onSubmitted: (text) {
              onSubmitted(context, password);
            },
            onPasswordType: (text) {
              sentTypePasswordEvent(context, "$text");
            },
          ),
        ),
      ],
    );
  }

  Widget _navigateToRegistrationScreenTitle(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: NavigateToRegistrationScreenTitle(
            onTap: () {
              sendNavigateRegistrationScreenEvent(context);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSignInButton(BuildContext context, LogInScreenState state) {
    return Column(
      children: [
        SizedBox(height: 11),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: SwissdentButton(
            width: double.infinity,
            buttonColor: codeButtonColor,
            isAvaliable: state.logInButtonIsAvailable,
            buttonText: Text(
              logInButtonText,
              style: semiBold17WhiteStyle,
            ),
            onTap: () {
              sendTapOnLogInButtonEvent(context);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildForgetPasswordTitle(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 18),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: ForgetPasswordTitle(
            onTap: () {
              sendNavigateRestoreScreenEvent(context);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLogInWithAccountsTitle() {
    return Column(
      children: [
        SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: LogInWithAccounts(),
        ),
      ],
    );
  }

  Widget _buildSocialMediaIcons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialIcon(
          path: iconFacebook,
          onIconTap: () {},
        ),
        SizedBox(width: 32),
        SocialIcon(
          path: iconGoogle,
          onIconTap: () {},
        ),
        SizedBox(width: 32),
        SocialIcon(
          path: iconVk,
          onIconTap: () {},
        ),
      ],
    );
  }

  void onSubmitted(BuildContext context, FocusNode nextFocus) {
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void sentTypeNumberEvent(BuildContext context, String phoneNumber) {
    BlocProvider.of<LogInScreenBloc>(context).add(TypeNumberEvent(phoneNumber));
  }

  void sentTypePasswordEvent(BuildContext context, String password) {
    BlocProvider.of<LogInScreenBloc>(context).add(TypePasswordEvent(password));
  }

  void sendTapOnLogInButtonEvent(BuildContext context) {
    BlocProvider.of<LogInScreenBloc>(context).add(TapOnLogInButtonEvent());
  }

  void sendNavigateRegistrationScreenEvent(BuildContext context) {
    BlocProvider.of<LogInScreenBloc>(context)
        .add(NavigateRegistrationScreenEvent());
  }

  void sendNavigateRestoreScreenEvent(BuildContext context) {
    BlocProvider.of<LogInScreenBloc>(context).add(NavigateRestoreScreenEvent());
  }

  void _navigateToMainMenuScreen() {
    Navigator.of(context)
        .pushAndRemoveUntil(buildRoute(MainMenuScreen()), (route) => false);
  }

  void _navigateToRegistrationScreen() {
    Navigator.of(context)
        .pushAndRemoveUntil(buildRoute(GetCodeScreen()), (route) => false);
  }

  void _navigateToRestoreScreen(
    BuildContext context,
    NavigateRestoreScreenState state,
  ) async {
    final phoneNumber = await Navigator.of(context).push<String>(
      buildRoute<String>(
        RestoreScreen(phoneNumber: state.phoneNumber),
      ),
    );
    BlocProvider.of<LogInScreenBloc>(context).add(
      PhoneUpdateEvent(phoneNumber),
    );
  }
}
