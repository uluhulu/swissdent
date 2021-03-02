import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/data/user_info/interactor/user_info_interactor.dart';
import 'package:swissdent/screens/user_profile_screen/bloc/user_profile_screen_bloc.dart';
import 'package:swissdent/screens/user_profile_screen/bloc/user_profile_screen_state.dart';
import 'package:swissdent/screens/user_profile_screen/widget/user_profile_photo.dart';
import 'package:swissdent/widget/appbar.dart';
import 'package:swissdent/widget/chat_button.dart';
import 'package:swissdent/widget/swissdent_button.dart';
import 'package:swissdent/widget/swissdent_textfield/swissdent_default_textfield.dart';
import 'package:swissdent/widget/swissdent_textfield/swissdent_num_textfield.dart';
import 'package:swissdent/di.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  FocusNode name;

  FocusNode surname;

  FocusNode num;

  FocusNode email;

  FocusNode password;

  FocusNode repeatPassword;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initFocusNode();
  }

  void initFocusNode() {
    name = FocusNode();
    surname = FocusNode();
    num = FocusNode();
    email = FocusNode();
    password = FocusNode();
    repeatPassword = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    disposeFocusNode();
  }

  void disposeFocusNode() {
    name.dispose();
    surname.dispose();
    email.dispose();
    password.dispose();
    num.dispose();
    repeatPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserProfileScreenBloc>(
      create: (BuildContext context) {
        return UserProfileScreenBloc(
          userInfoInteractor: getIt<UserInfoInteractor>(),
        );
      },
      child: Scaffold(
        appBar: buildAppbar(
          titleText: userProfileTitle,
          onBackCallback: () => Navigator.of(context).pop(),
          action: ChatButton(),
        ),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocConsumer<UserProfileScreenBloc, UserProfileScreenState>(
      listener: (BuildContext context, state) {
      },
      builder: (BuildContext context, state) {
        return SingleChildScrollView(
          // child: Container(),
          child: Column(
            children: [
              UserProfilePhoto(),
              _buildCommonData(context, state),
              SizedBox(
                height: 32,
              ),
              _buildPasswordChange(context),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 64, bottom: 47),
                child: SwissdentButton(
                  width: double.infinity,
                  isAvaliable: true,
                  buttonText: Text(
                    save,
                    style: semiBold17WhiteStyle,
                  ),
                  buttonColor: codeButtonColor,
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildCommonData(BuildContext context, UserProfileScreenState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            commonData,
            style: normal15StyleGrey,
          ),
          SizedBox(
            height: 16,
          ),
          SwissdentDefaultTextField(
            focusNode: name,
            onSubmitted: (text) {
              onSubmitted(context, surname);
            },
            hint: nameHint,
            defaultText: state.userName,
          ),
          SizedBox(
            height: 16,
          ),
          SwissdentDefaultTextField(
            focusNode: surname,
            onSubmitted: (text) {
              onSubmitted(context, num);
            },
            hint: surnameHint,
            defaultText: state.userSurname,
          ),
          SizedBox(
            height: 16,
          ),
          SwissdentNumTextField(
            focusNode: num,
            // customController: numberController,
            readOnly: true,
            onSubmitted: (text) {
              onSubmitted(context, email);
            },
            defaultText: state.userPhoneNumber,
          ),
          SizedBox(
            height: 16,
          ),
          SwissdentDefaultTextField(
            focusNode: email,
            hint: emailHint,
            defaultText: state.userEmail,
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordChange(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            passwordChange,
            style: normal15StyleGrey,
          ),
          SizedBox(
            height: 16,
          ),
          SwissdentDefaultTextField(
            focusNode: password,
            onSubmitted: (text) {
              onSubmitted(context, repeatPassword);
            },
            hint: newPassword,
          ),
          SizedBox(
            height: 16,
          ),
          SwissdentDefaultTextField(
            focusNode: repeatPassword,
            hint: repeatNewPassword,
          ),
        ],
      ),
    );
  }

  void onSubmitted(BuildContext context, FocusNode nextFocus) {
    FocusScope.of(context).requestFocus(nextFocus);
  }

}
