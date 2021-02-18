import 'package:flutter/material.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/widget/swissdent_textfield/base/swissdent_text_field.dart';
import 'package:swissdent/widget/swissdent_textfield/swissdent_default_textfield.dart';
import 'package:swissdent/widget/swissdent_textfield/swissdent_num_textfield.dart';

///user profile info
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=4%3A1156
class UserProfileInfo extends StatelessWidget {
  FocusNode name = FocusNode();
  FocusNode surname = FocusNode();
  FocusNode num = FocusNode();
  FocusNode email = FocusNode();
  FocusNode password = FocusNode();
  FocusNode repeatPassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _buildCommonData(context),
          SizedBox(
            height: 32,
          ),
          _buildPasswordChange(context),
        ],

      ),
    );
  }
  Widget _buildCommonData(BuildContext context){
    return  Column(
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
          defaultText: 'Константин',
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
          defaultText: 'Константинов',
        ),
        SizedBox(
          height: 16,
        ),
        SwissdentNumTextField(
          focusNode: num,
          onSubmitted: (text) {
            onSubmitted(context, email);
          },
          defaultText: '9827464162',
        ),
        SizedBox(
          height: 16,
        ),
        SwissdentDefaultTextField(
          focusNode: email,
          hint: emailHint,
        ),

      ],
    );
  }
  Widget _buildPasswordChange(BuildContext context){
    return Column(
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
          focusNode: repeatPassword ,
          hint: repeatNewPassword,
        ),
      ],
    );
  }
  void onSubmitted(BuildContext context, FocusNode nextFocus) {
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
