class GetCodeScreenState {
  final bool getCodeButtonIsAvaliable;
  final bool timerAvaliable;
  final int seconds;
  final bool smsCodeIsAvaliable;
  final bool nextButtonIsVisible;

  GetCodeScreenState({
    this.getCodeButtonIsAvaliable,
    this.timerAvaliable,
    this.seconds,
    this.smsCodeIsAvaliable,
    this.nextButtonIsVisible,
  });
}

class NavigateNextRegistrationScreenState extends GetCodeScreenState {
  NavigateNextRegistrationScreenState({
    bool getCodeButtonIsAvaliable,
    bool timerAvaliable,
    int seconds,
    bool smsCodeIsAvaliable,
    bool nextButtonIsVisible,
  }) : super(
          getCodeButtonIsAvaliable: getCodeButtonIsAvaliable,
          timerAvaliable: timerAvaliable,
          seconds: seconds,
          smsCodeIsAvaliable: smsCodeIsAvaliable,
          nextButtonIsVisible: nextButtonIsVisible,
        );
}

class ErrorConfirmCodeState extends GetCodeScreenState {}
class ErrorLogInState extends GetCodeScreenState {}