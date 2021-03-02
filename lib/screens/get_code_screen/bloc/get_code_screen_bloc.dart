import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/data/sign_in/interactor/sign_in_interactor.dart';
import 'package:swissdent/managers/exception.dart';
import 'package:swissdent/screens/get_code_screen/bloc/get_code_screen_event.dart';
import 'package:swissdent/screens/get_code_screen/bloc/get_code_screen_state.dart';
import 'package:swissdent/util/mask_formatter.dart';

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
  final int _phoneNumberMaxLength = 10;
  final SignInInteractor signInInteractor;

  final formatter = MaskTextInputFormatter(
    mask: '$numPrefix(###)###-##-##',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

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
      checkVariables();
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
      try {
        final registerResponse = await signInInteractor
            .register(formatter.maskText(phoneNumber));
        smsCode = registerResponse.code.toString();
        print(smsCode);
      } on NetworkException catch (e) {
        yield ErrorCodeState(
          getCodeButtonIsAvaliable: getCodeButtonIsAvaliable,
          timerAvaliable: timerAvaliable,
          seconds: _seconds,
          smsCodeIsAvaliable: smsCodeIsAvaliable,
          nextButtonIsVisible: nextButtonIsVisible,
          errorMessage: e.customErrorMessage,
        );
      }
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
      checkVariables();
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
      try {
        final confirmResponse = await signInInteractor.confirmCode(
            formatter.maskText(phoneNumber), smsCode);

        final loginResponse = await signInInteractor.authorization(
            formatter.maskText(phoneNumber), smsCode);
        if (loginResponse) {
          add(NavigateNextRegistrationScreenEvent());
        } else {
          yield ErrorLogInState();
        }
      } on NetworkException catch (e) {
        checkVariables();
        yield ErrorCodeState(
          getCodeButtonIsAvaliable: getCodeButtonIsAvaliable,
          timerAvaliable: timerAvaliable,
          seconds: _seconds,
          smsCodeIsAvaliable: smsCodeIsAvaliable,
          nextButtonIsVisible: nextButtonIsVisible,
          errorMessage: e.customErrorMessage,
        );
      }
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

  void checkVariables() {
    if(phoneNumberIsValid()){
      if(!timerAvaliable){
        getCodeButtonIsAvaliable = true;
      }else{
        getCodeButtonIsAvaliable = false;
      }

      if(smsCodeIsValid()){
        smsCodeIsAvaliable = true;
        getCodeButtonIsAvaliable = false;
        nextButtonIsVisible = true;
      }else{
        nextButtonIsVisible = false;
        smsCodeIsAvaliable = false;
      }
    }else{
      getCodeButtonIsAvaliable = false;
      nextButtonIsVisible = false;
    }
  }

  bool phoneNumberIsValid() {
    if (phoneNumber.length == _phoneNumberMaxLength) {
      return true;
    }
    return false;
  }

  bool smsCodeIsValid() {
    if (smsCode.length == _smsCodeMaxLength) {
      return true;
    }
    return false;
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
          timerAvaliable = true;
          getCodeButtonIsAvaliable = false;
        }
        add(UpdateTimerEvent(_seconds));
      },
    );
  }
}
