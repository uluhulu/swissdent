import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/screens/log_in_screen/widget/forget_password_title.dart';
import 'package:swissdent/screens/log_in_screen/widget/log_in_description.dart';
import 'package:swissdent/screens/log_in_screen/widget/log_in_title.dart';
import 'package:swissdent/screens/log_in_screen/widget/log_in_with_accounts_text.dart';
import 'package:swissdent/screens/log_in_screen/widget/navigate_to_registration_screen_title.dart';
import 'package:swissdent/screens/registration_screen/widgets/registration_social_icon.dart';
import 'package:swissdent/widget/registration_background/gradient_background.dart';
import 'package:swissdent/widget/registration_background/registration_wave.dart';
import 'package:swissdent/widget/swissdent_button.dart';
import 'package:swissdent/widget/swissdent_textfield/swissdent_num_textfield.dart';
import 'package:swissdent/widget/swissdent_textfield/swissdent_password_textfield.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        SizedBox(height: 80),
        LogInTitle(),
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23.0),
          child: LogInDescription(),
        ),
        SizedBox(height: 60),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: SwissdentNumTextField(
            onNumberType: (text) {
            },
          ),
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: SwissdentPasswordField(
            hintText: passwordText,
          ),
        ),
        SizedBox(height: 8,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: NavigateToRegistrationScreenTitle(),
        ),
        SizedBox(height: 11),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: SwissdentButton(
            width: double.infinity,
            buttonColor: codeButtonColor,
            isAvaliable: true,
            buttonText: Text(logInButtonText,style: semiBold17WhiteStyle, ),
          ),
        ),
        SizedBox(height: 18),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: ForgetPasswordTitle(),
        ),
        SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: LogInWithAccounts(),
        ),
        SizedBox(height: 24),
        _buildSocialMediaIcons(context),
        SizedBox(height: 32),
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
}
