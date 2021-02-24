import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/data/sign_in/interactor/sign_in_interactor.dart';
import 'package:swissdent/screens/registration_screen/bloc_registration_screen/registration_screen_bloc.dart';
import 'package:swissdent/screens/registration_screen/bloc_registration_screen/registration_screen_event.dart';
import 'package:swissdent/screens/registration_screen/widgets/bottom_sheet/bloc/bottom_sheet_state.dart';
import 'package:swissdent/screens/splash_screen/splash_screen_first_open/splash_screen.dart';
import 'package:swissdent/screens/splash_screen/splash_screen_registration/splash_screen_registration.dart';
import 'package:swissdent/util/route_builder.dart';
import 'package:swissdent/widget/swissdent_textfield/base/swissdent_text_field.dart';
import 'package:swissdent/widget/swissdent_textfield/swissdent_password_textfield.dart';

import '../../../../di.dart';
import 'bloc/bottom_sheet_bloc.dart';
import 'bloc/bottom_sheet_event.dart';

///password bottom sheet
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=3%3A2195
class PasswordBottomSheet extends StatefulWidget {
  const PasswordBottomSheet({
    Key key,
  }) : super(key: key);

  @override
  _PasswordBottomSheetState createState() => _PasswordBottomSheetState();
}

class _PasswordBottomSheetState extends State<PasswordBottomSheet> {
  FocusNode password;
  FocusNode passwordConfirmation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    password = FocusNode();
    passwordConfirmation = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passwordConfirmation.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return BottomSheetBloc(
          signInInteractor: getIt<SignInInteractor>()
        );
      },
      child: BlocConsumer<BottomSheetBloc, BottomSheetState>(
        listener: (BuildContext context, state) {
          if (state is NavigateNext) {
            navigateToNextScreen();
          }
        },
        builder: (BuildContext context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 18.0, top: 21),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  createPasswordText,
                  style: semiBold17BlackStyle,
                ),
                SizedBox(height: 34),
                SwissdentPasswordField(
                  onPasswordType: (password) {
                    sendTypePasswordEvent(context, password);
                  },
                  hintText: passwordText,
                  focusNode: password,
                  onSubmitted: (text) {
                    onSubmitted(context, passwordConfirmation);
                  },
                ),
                SizedBox(height: 16),
                SwissdentPasswordField(
                  onPasswordType: (passwordConfirmation) {},
                  onSubmitted: (passwordConfirmation) {
                    sendTypePasswordConfirmationEvent(
                      context,
                      passwordConfirmation,
                    );
                  },
                  hintText: repeatPasswordText,
                  focusNode: passwordConfirmation,
                ),
                SizedBox(height: 27),
                SizedBox(
                  height: MediaQuery.of(context).viewInsets.bottom,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void onSubmitted(BuildContext context, FocusNode nextFocus) {
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void sendTypePasswordEvent(BuildContext context, String password) {
    BlocProvider.of<BottomSheetBloc>(context).add(TypePasswordEvent(password));
  }

  void sendTypePasswordConfirmationEvent(
      BuildContext context, String passwordConfirmation) {
    BlocProvider.of<BottomSheetBloc>(context)
        .add(TypePasswordConfirmation(passwordConfirmation));
  }

  void navigateToNextScreen() {
    Navigator.of(context).pushAndRemoveUntil(
      buildRoute(
        SplashScreenRegistration(),
      ),
      (route) => false,
    );
  }
}
