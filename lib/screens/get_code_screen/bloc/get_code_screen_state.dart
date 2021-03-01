class GetCodeScreenState {
  final bool getCodeButtonIsAvaliable;
  final bool timerAvaliable;
  final int seconds;
  final bool smsCodeIsAvaliable;
  final bool nextButtonIsVisible;
  final String phoneNumber;

  GetCodeScreenState({
    this.getCodeButtonIsAvaliable,
    this.timerAvaliable,
    this.seconds,
    this.smsCodeIsAvaliable,
    this.nextButtonIsVisible,
    this.phoneNumber,
  });
}

class NavigateNextRegistrationScreenState extends GetCodeScreenState {
  NavigateNextRegistrationScreenState({
    bool getCodeButtonIsAvaliable,
    bool timerAvaliable,
    int seconds,
    bool smsCodeIsAvaliable,
    bool nextButtonIsVisible,
    String phoneNumber,
  }) : super(
          getCodeButtonIsAvaliable: getCodeButtonIsAvaliable,
          timerAvaliable: timerAvaliable,
          seconds: seconds,
          smsCodeIsAvaliable: smsCodeIsAvaliable,
          nextButtonIsVisible: nextButtonIsVisible,
          phoneNumber: phoneNumber,
        );
}

class NavigateRestoreScreenState extends GetCodeScreenState {
  NavigateRestoreScreenState({
    bool getCodeButtonIsAvaliable,
    bool timerAvaliable,
    int seconds,
    bool smsCodeIsAvaliable,
    bool nextButtonIsVisible,
    String phoneNumber,
  }) : super(
          getCodeButtonIsAvaliable: getCodeButtonIsAvaliable,
          timerAvaliable: timerAvaliable,
          seconds: seconds,
          smsCodeIsAvaliable: smsCodeIsAvaliable,
          nextButtonIsVisible: nextButtonIsVisible,
          phoneNumber: phoneNumber,
        );
}

class ErrorConfirmCodeState extends GetCodeScreenState {}

class ErrorLogInState extends GetCodeScreenState {}

class UpdateNumberState extends GetCodeScreenState {
  UpdateNumberState({
    bool getCodeButtonIsAvaliable,
    bool timerAvaliable,
    int seconds,
    bool smsCodeIsAvaliable,
    bool nextButtonIsVisible,
    String phoneNumber,
  }) : super(
          getCodeButtonIsAvaliable: getCodeButtonIsAvaliable,
          timerAvaliable: timerAvaliable,
          seconds: seconds,
          smsCodeIsAvaliable: smsCodeIsAvaliable,
          nextButtonIsVisible: nextButtonIsVisible,
          phoneNumber: phoneNumber,
        );
}
