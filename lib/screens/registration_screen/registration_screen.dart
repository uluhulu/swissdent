import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/screens/registration_screen/bloc/registration_screen_bloc.dart';
import 'package:swissdent/screens/registration_screen/bloc/registration_screen_event.dart';
import 'package:swissdent/screens/registration_screen/bloc/registration_screen_state.dart';
import 'package:swissdent/screens/registration_screen/widgets/password_bottom_sheet.dart';
import 'package:swissdent/screens/registration_screen/widgets/registration_social_icon.dart';
import 'package:swissdent/screens/registration_screen/widgets/registration_with_accounts.dart';
import 'package:swissdent/widget/blue_button.dart';
import 'package:swissdent/widget/registration_background/registration_background.dart';
import 'package:swissdent/widget/registration_background/registration_wave.dart';
import 'package:swissdent/widget/registration_title/registration_title.dart';
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
      create: (BuildContext context){
        return RegistrationScreenBloc();
      },
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  RegistrationBackground(),
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
    return BlocConsumer<RegistrationScreenBloc,RegistrationScreenState>(
      listener: (BuildContext context, state){},
      builder: (BuildContext context, state){
        return Column(
          children: [
            RegistrationTitle(),
            SizedBox(
              height: 80,
            ),
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
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SwissdentDefaultTextField(
                hint: surnameHint,
                focusNode: surname,
                onSubmitted: (text) {
                  onSubmitted(context, email);
                },
                onType: (surname){
                  sendTypeSurnameEvent(context, surname);
                },
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SwissdentNumTextField(
                readOnly: true,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SwissdentTextField(
                hintText: emailHint,
                hintStyle: normal15Style,
                focusNode: email,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: RegistrationWithAccounts(),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialIcon(
                  path: iconFacebook,
                  onIconTap: () {},
                ),
                SizedBox(
                  width: 32,
                ),
                SocialIcon(
                  path: iconGoogle,
                  onIconTap: () {},
                ),
                SizedBox(
                  width: 32,
                ),
                SocialIcon(
                  path: iconVk,
                  onIconTap: () {},
                ),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            BlueButton(
              isAvaliable: state is RegistrationButtonActive ? true : false,
              buttonText: registrationText,
              onTap: () {
                ///todo open bottomsheet
                showPasswordBottomSheet(context);
              },
            ),
          ],
        );
      },

    );
  }

  void showPasswordBottomSheet(BuildContext blocContext) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return PasswordBottomSheet(blocContext: blocContext,);
      },
    );
  }

  void onSubmitted(BuildContext context, FocusNode nextFocus) {
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void sendTypeNameEvent(BuildContext context, String name){
    BlocProvider.of<RegistrationScreenBloc>(context).add(
      TypeNameEvent(name)
    );
  }
  void sendTypeSurnameEvent(BuildContext context, String surname){
    BlocProvider.of<RegistrationScreenBloc>(context).add(
        TypeSurnameEvent(surname)
    );
  }

}
