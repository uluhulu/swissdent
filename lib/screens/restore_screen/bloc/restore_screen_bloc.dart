import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:swissdent/data/sign_in/interactor/sign_in_interactor.dart';
import 'package:swissdent/managers/exception.dart';
import 'package:swissdent/screens/restore_screen/bloc/restore_screen_event.dart';
import 'package:swissdent/screens/restore_screen/bloc/restore_screen_state.dart';
import 'package:swissdent/constants/strings.dart';

class RestoreScreenBloc extends Bloc<RestoreScreenEvent, RestoreScreenState> {
  String phoneNumber = '';
  String password = '';
  bool restoreButtonIsAvailable = false;

  final formatter = MaskTextInputFormatter(
    mask: '$numPrefix(###)###-##-##',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  final SignInInteractor signInInteractor;

  RestoreScreenBloc({this.signInInteractor})
      : super(RestoreScreenState(
          restoreButtonIsAvailable: false,
        ));

  @override
  Stream<RestoreScreenState> mapEventToState(RestoreScreenEvent event) async* {
    yield* mapTypeNumberEvent(event);
    yield* mapRestorePasswordEvent(event);
  }

  @override
  Stream<RestoreScreenState> mapTypeNumberEvent(
    RestoreScreenEvent event,
  ) async* {
    if (event is TypeNumberEvent) {
      phoneNumber = event.number;
      restoreButtonAvailableCheck();
      yield RestoreScreenState(
        phoneNumber: phoneNumber,
        restoreButtonIsAvailable: restoreButtonIsAvailable,
      );
    }
  }

  @override
  Stream<RestoreScreenState> mapRestorePasswordEvent(
    RestoreScreenEvent event,
  ) async* {
    if (event is RestorePasswordEvent) {
      try {
        final restoreResponse = await signInInteractor
            .restorePassword(formatter.maskText(phoneNumber));
        password = restoreResponse.code;
        print(password);
        yield RestoreSucceedState(
          phoneNumber: phoneNumber,
          restoreButtonIsAvailable: restoreButtonIsAvailable,
        );
      } on NetworkException catch (e) {
        yield RestoreNotSucceedState(
          restoreButtonIsAvailable: restoreButtonIsAvailable,
          errorMessage: e.customErrorMessage,
        );
      }
    }
  }

  void restoreButtonAvailableCheck() {
    if (phoneNumber.length == 10) {
      restoreButtonIsAvailable = true;
    } else {
      restoreButtonIsAvailable = false;
    }
  }
}
