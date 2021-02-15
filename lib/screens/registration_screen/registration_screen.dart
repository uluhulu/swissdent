import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/screens/registration_screen/bloc_registration_screen/registration_screen_bloc.dart';
import 'package:swissdent/screens/registration_screen/bloc_registration_screen/registration_screen_event.dart';
import 'package:swissdent/screens/registration_screen/bloc_registration_screen/registration_screen_state.dart';
import 'package:swissdent/screens/registration_screen/bloc_registration_screen/registration_screen_state.dart';
import 'package:swissdent/screens/registration_screen/widgets/bottom_sheet/password_bottom_sheet.dart';
import 'package:swissdent/screens/registration_screen/widgets/registration_social_icon.dart';
import 'package:swissdent/screens/registration_screen/widgets/registration_with_accounts.dart';
import 'package:swissdent/screens/splash_screen/splash_screen_first_open/splash_screen.dart';
import 'package:swissdent/util/route_builder.dart';
import 'package:swissdent/widget/registration_background/gradient_background.dart';
import 'package:swissdent/widget/registration_background/registration_wave.dart';
import 'package:swissdent/widget/registration_title/registration_title.dart';
import 'package:swissdent/widget/swissdent_button.dart';
import 'package:swissdent/widget/swissdent_textfield/base/swissdent_text_field.dart';
import 'package:swissdent/widget/swissdent_textfield/swissdent_default_textfield.dart';
import 'package:swissdent/widget/swissdent_textfield/swissdent_num_textfield.dart';
import 'package:swissdent/widget/swissdent_textfield/swissdent_password_textfield.dart';

///step 2 registration screen
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=2%3A1378
class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  FocusNode name;
  FocusNode surname;
  FocusNode email;

  @override
  void initState() {
    super.initState();
    name = FocusNode();
    surname = FocusNode();
    email = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    name.dispose();
    surname.dispose();
    email.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return RegistrationScreenBloc();
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
    return BlocConsumer<RegistrationScreenBloc, RegistrationScreenState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return Column(
          children: [
            RegistrationTitle(),
            SizedBox(height: 80),
            _buildRegistrationTextFields(context),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: RegistrationWithAccounts(),
            ),
            SizedBox(height: 24),
            _buildSocialMediaIcons(context),
            SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: SwissdentButton(
                buttonColor: codeButtonColor,
                isAvaliable: state is RegistrationButtonActive ? true : false,
                buttonText: registrationText,
                onTap: () {
                  ///todo open bottomsheet
                  showPasswordBottomSheet(context);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildRegistrationTextFields(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SwissdentDefaultTextField(
            hint: nameHint,
            focusNode: name,
            onSubmitted: (text) {
              onSubmitted(context, surname);
            },
            onType: (name) {
              sendTypeNameEvent(context, name);
            },
          ),
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SwissdentDefaultTextField(
            hint: surnameHint,
            focusNode: surname,
            onSubmitted: (text) {
              onSubmitted(context, email);
            },
            onType: (surname) {
              sendTypeSurnameEvent(context, surname);
            },
          ),
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SwissdentNumTextField(
            readOnly: true,
            defaultText: '9827464162',
          ),
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SwissdentDefaultTextField(
            hint: emailHint,
            focusNode: email,
            onType: (email) {
              sendTypeEmailEvent(context, email);
            },
          ),
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

  void showPasswordBottomSheet(BuildContext blocContext) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: blocContext,
      builder: (BuildContext context) {
        return PasswordBottomSheet();
      },
    );
  }

  void onSubmitted(BuildContext context, FocusNode nextFocus) {
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void sendTypeNameEvent(BuildContext context, String name) {
    BlocProvider.of<RegistrationScreenBloc>(context).add(TypeNameEvent(name));
  }

  void sendTypeEmailEvent(BuildContext context, String email) {
    BlocProvider.of<RegistrationScreenBloc>(context).add(TypeEmailEvent(email));
  }

  void sendTypeSurnameEvent(BuildContext context, String surname) {
    BlocProvider.of<RegistrationScreenBloc>(context)
        .add(TypeSurnameEvent(surname));
  }
}
