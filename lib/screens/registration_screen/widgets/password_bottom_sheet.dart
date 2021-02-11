import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/screens/registration_screen/bloc/registration_screen_bloc.dart';
import 'package:swissdent/screens/registration_screen/bloc/registration_screen_event.dart';
import 'package:swissdent/widget/swissdent_textfield/base/swissdent_text_field.dart';
import 'package:swissdent/widget/swissdent_textfield/swissdent_password_textfield.dart';

///password bottom sheet
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=3%3A2195
class PasswordBottomSheet extends StatefulWidget {
  final BuildContext blocContext;

  const PasswordBottomSheet({
    Key key,
    this.blocContext,
  }) : super(key: key);

  @override
  _PasswordBottomSheetState createState() => _PasswordBottomSheetState();
}

class _PasswordBottomSheetState extends State<PasswordBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 221,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 18.0, top: 21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              createPasswordText,
              style: semiBold17BlackStyle,
            ),
            SizedBox(
              height: 34,
            ),
            SwissdentPasswordField(
              onPasswordType: (password) {
                sendTypePasswordEvent(context, password);
              },
              hintText: passwordText,
            ),
            SizedBox(
              height: 16,
            ),
            SwissdentPasswordField(
              onPasswordType: (password) {
                sendTypePasswordEvent(context, password);
              },
              hintText: repeatPasswordText,
            ),
          ],
        ),
      ),
    );
  }

  void sendTypePasswordEvent(BuildContext context, String password) {
    BlocProvider.of<RegistrationScreenBloc>(context)
        .add(TypePasswordEvent(password));
  }
  void TypePasswordConfirmation(BuildContext context, String passwordConfirmation) {
    BlocProvider.of<RegistrationScreenBloc>(context)
        .add(TypePasswordEvent(passwordConfirmation));
  }
}
