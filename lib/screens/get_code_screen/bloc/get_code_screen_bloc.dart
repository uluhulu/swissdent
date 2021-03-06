import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:swissdent/data/sign_in/interactor/sign_in_interactor.dart';
import 'package:swissdent/screens/get_code_screen/bloc/get_code_screen_event.dart';
import 'package:swissdent/screens/get_code_screen/bloc/get_code_screen_state.dart';

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

  final SignInInteractor signInInteractor;

  static final numPrefix = '+7';
  final maskFormatter = new MaskTextInputFormatter(
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
        )) {
    // startTimer();
  }

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
      );
    }
  }

  @override
  Stream<GetCodeScreenState> mapGetCodeEvent(
    GetCodeScreenEvent event,
  ) async* {
    if (event is GetCodeEvent) {
      print(maskFormatter.maskText(phoneNumber));
      final registerResponse =
          await signInInteractor.register(maskFormatter.maskText(phoneNumber));
      smsCode = registerResponse.code;
      print(smsCode);
      getCodeButtonIsAvaliable = false;
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
      );
    }
  }

  Stream<GetCodeScreenState> mapConfirmCodeEvent(
    GetCodeScreenEvent event,
  ) async* {
    if (event is ConfirmCodeEvent) {
      print("код для отправки:$smsCode номер$phoneNumber");
      final confirmResponse = await signInInteractor.confirmCode(
          maskFormatter.maskText(phoneNumber), smsCode);
      if (confirmResponse){
        final loginResponse = await signInInteractor.authorization( maskFormatter.maskText(phoneNumber), smsCode);
        add(NavigateNextRegistrationScreenEvent());}
      else
        yield ErrorConfirmCodeState();
    }

    ///запрос подтверждения
    ///если ок -> add(NavigateNextRegistrationScreenEvent)
    ///если ок -> aadd(error event)
  }

  void smsCodeCheck() {
    if (smsCode.length == 4) {
      ///todo запрос
      ///если запрос ок
      smsCodeIsAvaliable = true;
      getCodeButtonIsAvaliable = false;
      nextButtonIsVisible = true;
    } else {
      smsCodeIsAvaliable = false;
      if (_seconds == 45 && phoneNumber.length == 11) {
        getCodeButtonIsAvaliable = true;
      }
      nextButtonIsVisible = false;
    }
  }

  /// Проверка активации кнопки "Получить код"
  void codeButtonAvaliableCheck() {
    if (phoneNumber.length == 10 && timerAvaliable == false) {
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
          _seconds = 45;
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
