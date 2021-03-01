import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:swissdent/data/sign_in/interactor/sign_in_interactor.dart';
import 'package:swissdent/screens/get_code_screen/bloc/get_code_screen_event.dart';
import 'package:swissdent/screens/get_code_screen/bloc/get_code_screen_state.dart';
import 'package:swissdent/util/mask_formatter_for_request.dart';

class GetCodeScreenBloc extends Bloc<GetCodeScreenEvent, GetCodeScreenState> {
  String phoneNumber = '';
  String smsCode = '';
  bool getCodeButtonIsAvaliable = false;
  bool firstNumberType = true;
  bool timerAvaliable = false;
  bool smsCodeIsAvaliable = false;
  bool nextButtonIsVisible = false;

  Timer _timer;
  int _seconds = 45;
  final int _timerMaxTime = 45;
  final int _smsCodeMaxLength = 4;
  final int _phoneNumberMaxLength = 11;
  final int _phoneNumberLengthWithoutPrefix = 10;
  final SignInInteractor signInInteractor;

  GetCodeScreenBloc({this.signInInteractor})
      : super(GetCodeScreenState(
          getCodeButtonIsAvaliable: false,
          timerAvaliable: false,
          seconds: 45,
          smsCodeIsAvaliable: false,
          nextButtonIsVisible: false,
          phoneNumber: '',
        ));

  @override
  Stream<GetCodeScreenState> mapEventToState(
    GetCodeScreenEvent event,
  ) async* {
    yield* mapTypeNumberEvent(event);
    yield* mapTimerEvent(event);
    yield* mapGetCodeEvent(event);
    yield* mapTypeSmsCodeEvent(event);
    yield* mapNavigateNextRegistrationScreenEvent(event);
    yield* mapConfirmCodeEvent(event);
    yield* mapNavigateRestoreScreenEvent(event);
    yield* mapUpdatePhoneEvent(event);
  }

  @override
  Stream<GetCodeScreenState> mapTypeNumberEvent(
    GetCodeScreenEvent event,
  ) async* {
    if (event is TypeNumberEvent) {
      phoneNumber = event.number;
      codeButtonAvaliableCheck();
      yield GetCodeScreenState(
        getCodeButtonIsAvaliable: getCodeButtonIsAvaliable,
        timerAvaliable: timerAvaliable,
        seconds: _seconds,
        smsCodeIsAvaliable: smsCodeIsAvaliable,
        nextButtonIsVisible: nextButtonIsVisible,
        phoneNumber: phoneNumber,
      );
    }
  }

  @override
  Stream<GetCodeScreenState> mapGetCodeEvent(
    GetCodeScreenEvent event,
  ) async* {
    if (event is GetCodeEvent) {
      getCodeButtonIsAvaliable = false;
      yield GetCodeScreenState(
        getCodeButtonIsAvaliable: getCodeButtonIsAvaliable,
        timerAvaliable: timerAvaliable,
        seconds: _seconds,
        smsCodeIsAvaliable: smsCodeIsAvaliable,
        nextButtonIsVisible: nextButtonIsVisible,
        phoneNumber: phoneNumber,
      );
      final registerResponse =
          await signInInteractor.register(maskFormatterForRequest.maskText(phoneNumber));
      smsCode = registerResponse.code;
      print(smsCode);
      timerAvaliable = true;
      startTimer();
    }
  }

  @override
  Stream<GetCodeScreenState> mapTimerEvent(
    GetCodeScreenEvent event,
  ) async* {
    if (event is UpdateTimerEvent) {
      yield GetCodeScreenState(
        getCodeButtonIsAvaliable: getCodeButtonIsAvaliable,
        timerAvaliable: timerAvaliable,
        seconds: event.seconds,
        smsCodeIsAvaliable: smsCodeIsAvaliable,
        nextButtonIsVisible: nextButtonIsVisible,
        phoneNumber: phoneNumber,
      );
    }
  }

  @override
  Stream<GetCodeScreenState> mapTypeSmsCodeEvent(
    GetCodeScreenEvent event,
  ) async* {
    if (event is TypeSmsCodeEvent) {
      smsCode = event.code;
      smsCodeCheck();
      yield GetCodeScreenState(
        getCodeButtonIsAvaliable: getCodeButtonIsAvaliable,
        timerAvaliable: timerAvaliable,
        seconds: _seconds,
        smsCodeIsAvaliable: smsCodeIsAvaliable,
        nextButtonIsVisible: nextButtonIsVisible,
        phoneNumber: phoneNumber,
      );
    }
  }

  @override
  Stream<GetCodeScreenState> mapNavigateNextRegistrationScreenEvent(
    GetCodeScreenEvent event,
  ) async* {
    if (event is NavigateNextRegistrationScreenEvent) {
      yield NavigateNextRegistrationScreenState(
        getCodeButtonIsAvaliable: getCodeButtonIsAvaliable,
        timerAvaliable: timerAvaliable,
        seconds: _seconds,
        smsCodeIsAvaliable: smsCodeIsAvaliable,
        nextButtonIsVisible: nextButtonIsVisible,
        phoneNumber: phoneNumber,
      );
    }
  }

  Stream<GetCodeScreenState> mapNavigateRestoreScreenEvent(
    GetCodeScreenEvent event,
  ) async* {
    if (event is NavigateRestoreScreenEvent) {
      yield NavigateRestoreScreenState(
        getCodeButtonIsAvaliable: getCodeButtonIsAvaliable,
        timerAvaliable: timerAvaliable,
        seconds: _seconds,
        smsCodeIsAvaliable: smsCodeIsAvaliable,
        nextButtonIsVisible: nextButtonIsVisible,
        phoneNumber: phoneNumber,
      );
    }
  }

  Stream<GetCodeScreenState> mapConfirmCodeEvent(
    GetCodeScreenEvent event,
  ) async* {
    if (event is ConfirmCodeEvent) {
      nextButtonIsVisible = false;
      yield GetCodeScreenState(
        getCodeButtonIsAvaliable: getCodeButtonIsAvaliable,
        timerAvaliable: timerAvaliable,
        seconds: _seconds,
        smsCodeIsAvaliable: smsCodeIsAvaliable,
        nextButtonIsVisible: nextButtonIsVisible,
        phoneNumber: phoneNumber,
      );
      final confirmResponse = await signInInteractor.confirmCode(
          maskFormatterForRequest.maskText(phoneNumber), smsCode);
      if (confirmResponse) {
        final loginResponse = await signInInteractor.authorization(
            maskFormatterForRequest.maskText(phoneNumber), smsCode);
        if (loginResponse) {
          add(NavigateNextRegistrationScreenEvent());
        } else {
          yield ErrorLogInState();
        }
      } else
        yield ErrorConfirmCodeState();
    }

    ///запрос подтверждения
    ///если ок -> add(NavigateNextRegistrationScreenEvent)
    ///если ок -> aadd(error event)
  }

  @override
  Stream<GetCodeScreenState> mapUpdatePhoneEvent(
    GetCodeScreenEvent event,
  ) async* {
    if (event is PhoneUpdateEvent) {
      phoneNumber = event.phoneNumber;
      print("номер обновлен $phoneNumber");
      yield UpdateNumberState(
        getCodeButtonIsAvaliable: getCodeButtonIsAvaliable,
        timerAvaliable: timerAvaliable,
        seconds: _seconds,
        smsCodeIsAvaliable: smsCodeIsAvaliable,
        nextButtonIsVisible: nextButtonIsVisible,
        phoneNumber: phoneNumber,
      );
    }
  }

  void smsCodeCheck() {
    if (smsCode.length == _smsCodeMaxLength) {
      ///todo запрос
      ///если запрос ок
      smsCodeIsAvaliable = true;
      getCodeButtonIsAvaliable = false;
      nextButtonIsVisible = true;
    } else {
      smsCodeIsAvaliable = false;
      if (_seconds == _timerMaxTime &&
          phoneNumber.length == _phoneNumberMaxLength) {
        getCodeButtonIsAvaliable = true;
      }
      nextButtonIsVisible = false;
    }
  }

  /// Проверка активации кнопки "Получить код"
  void codeButtonAvaliableCheck() {
    if (phoneNumber.length == _phoneNumberLengthWithoutPrefix &&
        timerAvaliable == false) {
      getCodeButtonIsAvaliable = true;
    } else {
      getCodeButtonIsAvaliable = false;
    }
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_seconds == 0) {
          timer.cancel();
          _seconds = _timerMaxTime;
          timerAvaliable = false;
          getCodeButtonIsAvaliable = true;
        } else {
          _seconds--;
          // timerAvaliable = true;
          // getCodeButtonIsAvaliable = false;
        }
        add(UpdateTimerEvent(_seconds));
      },
    );
  }
}
