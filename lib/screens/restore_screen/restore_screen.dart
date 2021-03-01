import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/data/sign_in/interactor/sign_in_interactor.dart';
import 'package:swissdent/di.dart';
import 'package:swissdent/screens/restore_screen/bloc/restore_screen_event.dart';
import 'package:swissdent/screens/restore_screen/bloc/restore_screen_bloc.dart';
import 'package:swissdent/screens/restore_screen/bloc/restore_screen_state.dart';
import 'package:swissdent/screens/restore_screen/widget/restore_discription.dart';
import 'package:swissdent/screens/restore_screen/widget/restore_title.dart';
import 'package:swissdent/widget/registration_background/gradient_background.dart';
import 'package:swissdent/widget/registration_background/registration_wave.dart';
import 'package:swissdent/widget/swissdent_button.dart';
import 'package:swissdent/widget/swissdent_textfield/swissdent_num_textfield.dart';

///restore password
class RestoreScreen extends StatefulWidget {
  @override
  _RestoreScreenState createState() => _RestoreScreenState();
}

class _RestoreScreenState extends State<RestoreScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return RestoreScreenBloc(
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
                child: _buildBody(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocConsumer<RestoreScreenBloc, RestoreScreenState>(
      listener: (BuildContext context, state) {
        if (state is RestoreSucceedState){
          print("номер телефона ${state.phoneNumber}");
          Navigator.of(context).pop<String>(state.phoneNumber);
        }
          if (state is RestoreNotSucceedState) {
          print("Что-то пошло не так, номер нашей тех. поддержки ХХХХХ");
        }
      },
      builder: (BuildContext context, state) {
        return Column(
          children: [
            _buildTitleAndDescription(),
            _buildNumTextField(context),
            _buildRestoreButton(context, state),
          ],
        );
      },
    );
  }

  Widget _buildTitleAndDescription() {
    return Column(
      children: [
        SizedBox(
          height: 124,
        ),
        RestoreTitle(),
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23.0),
          child: RestoreDiscription(),
        ),
      ],
    );
  }

  Widget _buildNumTextField(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 80),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: SwissdentNumTextField(
            onNumberType: (text) {
              print("номер на входе  1 $text");
              sendTypeNumberEvent(text, context);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRestoreButton(BuildContext context, state) {
    return Column(
      children: [
        SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: SwissdentButton(
            width: double.infinity,
            buttonColor: codeButtonColor,
            isAvaliable: state.restoreButtonIsAvailable,
            buttonText: Text(
              restoreText,
              style: semiBold17WhiteStyle,
            ),
            onTap: () {
              sendRestorePasswordEvent(context);
            },
          ),
        ),
        SizedBox(
          height: 152,
        ),
      ],
    );
  }

  void sendTypeNumberEvent(String number, BuildContext context) {
    print("номер на входе $number");
    BlocProvider.of<RestoreScreenBloc>(context).add(TypeNumberEvent(number));
  }

  void sendRestorePasswordEvent(BuildContext context) {
    BlocProvider.of<RestoreScreenBloc>(context).add(RestorePasswordEvent());
  }
}
