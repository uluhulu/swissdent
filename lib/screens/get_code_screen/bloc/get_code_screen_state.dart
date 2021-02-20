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

}
