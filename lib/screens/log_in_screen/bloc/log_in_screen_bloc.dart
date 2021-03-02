import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/data/sign_in/interactor/sign_in_interactor.dart';
import 'package:swissdent/screens/log_in_screen/bloc/log_in_screen_event.dart';
import 'package:swissdent/screens/log_in_screen/bloc/log_in_screen_state.dart';
import 'package:swissdent/util/mask_formatter.dart';

class LogInScreenBloc extends Bloc<LogInScreenEvent, LogInScreenState> {
  String phoneNumber = '';
  String password = '';
  bool logInButtonIsAvailable = false;

  final SignInInteractor signInInteractor;

  final formatter = MaskTextInputFormatter(
    mask: '$numPrefix(###)###-##-##',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  LogInScreenBloc({this.signInInteractor})
      : super(LogInScreenState(
          logInButtonIsAvailable: false,
        )) {
    init();
  }

  @override
  Stream<LogInScreenState> mapEventToState(LogInScreenEvent event) async* {
    yield* mapInitEvent(event);
    yield* mapTypeNumberEvent(event);
    yield* mapTypePasswordEvent(event);
    yield* mapTapOnLogInButtonEvent(event);
    yield* mapNavigateMainMenuScreenEvent(event);
    yield* mapNavigateRegistrationScreenEvent(event);
    yield* mapNavigateRestoreScreenEvent(event);
    yield* mapUpdatePhoneEvent(event);
  }

  Stream<LogInScreenState> mapInitEvent(
    LogInScreenEvent event,
  ) async* {
    if (event is LoginScreenInitEvent) {
      yield LogInScreenState(
        logInButtonIsAvailable: logInButtonIsAvailable,
        phoneNumber: phoneNumber,
        password: password,
      );
    }
  }


  Stream<LogInScreenState> mapTypeNumberEvent(LogInScreenEvent event) async* {
    if (event is TypeNumberEvent) {
      phoneNumber = event.number;
      yield LogInScreenState(logInButtonIsAvailable: logInButtonIsAvailable);
    }
  }

  Stream<LogInScreenState> mapTypePasswordEvent(LogInScreenEvent event) async* {
    if (event is TypePasswordEvent) {
      password = event.password;
      logInButtonIsAvailableCheck();
      yield LogInScreenState(
        logInButtonIsAvailable: logInButtonIsAvailable,
        phoneNumber: phoneNumber,
      );
    }
  }

  Stream<LogInScreenState> mapTapOnLogInButtonEvent(
      LogInScreenEvent event) async* {
    if (event is TapOnLogInButtonEvent) {
      logInButtonIsAvailable = false;
      yield LogInScreenState(
        logInButtonIsAvailable: logInButtonIsAvailable,
      );
      final logInResponse = await signInInteractor.authorization(
          formatter.maskText(phoneNumber), password);
      if (logInResponse) {
        yield NavigateMainMenuScreenState(
          logInButtonIsAvailable: logInButtonIsAvailable,
        );
      } else {
        logInButtonIsAvailable = true;
        yield LogInScreenState(
          logInButtonIsAvailable: logInButtonIsAvailable,
          phoneNumber: phoneNumber,
        );
        print('ошибка запроса логина');
      }
    }
  }

  Stream<LogInScreenState> mapNavigateMainMenuScreenEvent(
      LogInScreenEvent event) async* {
    if (event is NavigateMainMenuScreenEvent) {
      yield NavigateMainMenuScreenState(
        logInButtonIsAvailable: logInButtonIsAvailable,
        phoneNumber: phoneNumber,
      );
    }
  }

  Stream<LogInScreenState> mapNavigateRegistrationScreenEvent(
      LogInScreenEvent event) async* {
    if (event is NavigateRegistrationScreenEvent) {
      yield NavigateRegistrationScreenState(
        logInButtonIsAvailable: logInButtonIsAvailable,
        phoneNumber: phoneNumber,
      );
    }
  }

  Stream<LogInScreenState> mapNavigateRestoreScreenEvent(
      LogInScreenEvent event) async* {
    if (event is NavigateRestoreScreenEvent) {
      print("bloc num $phoneNumber");
      yield NavigateRestoreScreenState(
        logInButtonIsAvailable: logInButtonIsAvailable,
        phoneNumber: phoneNumber,
      );
    }
  }

  void init() {
    add(LoginScreenInitEvent());
  }

  Stream<LogInScreenState> mapUpdatePhoneEvent(
    LogInScreenEvent event,
  ) async* {
    if (event is PhoneUpdateEvent) {
      phoneNumber = event.phoneNumber;
      print("номер обновлен $phoneNumber");
      yield UpdateNumberState(
        logInButtonIsAvailable: logInButtonIsAvailable,
        phoneNumber: phoneNumber,
      );
    }
  }

  void logInButtonIsAvailableCheck() {
    if (phoneNumber.length == 10 && password.length >= 1) {
      logInButtonIsAvailable = true;
    } else {
      logInButtonIsAvailable = false;
    }
  }
}
