import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
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

  GetCodeScreenBloc()
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
      );
    }
  }

  void smsCodeCheck() {
    if (smsCode.length == 4) {
      ///todo сделать запрос проверки кода
      smsCodeIsAvaliable = true;
      getCodeButtonIsAvaliable = false;
      nextButtonIsVisible = true;
    } else {
      smsCodeIsAvaliable = false;
      // getCodeButtonIsAvaliable = true;
      nextButtonIsVisible = false;

    }
  }

  /// Проверка активации кнопки "Получить код"
  void codeButtonAvaliableCheck() {
    if (phoneNumber.length == 11 && timerAvaliable == false) {
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
          timerAvaliable = true;
          getCodeButtonIsAvaliable = false;
        }
        add(UpdateTimerEvent(_seconds));
      },
    );
  }
}
