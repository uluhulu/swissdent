class RegistrationScreenState {
  final bool getCodeButtonIsAvaliable;
  final bool timerAvaliable;
  final int seconds;
  final bool smsCodeIsAvaliable;
  final bool nextButtonIsVisible;

  RegistrationScreenState({
    this.getCodeButtonIsAvaliable,
    this.timerAvaliable,
    this.seconds,
    this.smsCodeIsAvaliable,
    this.nextButtonIsVisible,
  });
}

class NavigateNextScreenState extends RegistrationScreenState {}
