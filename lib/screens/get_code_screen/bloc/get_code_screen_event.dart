class RegistrationScreenEvent {}

class TypeNumberEvent extends RegistrationScreenEvent {
  final String number;

  TypeNumberEvent(this.number);
}

class TypeSmsCodeEvent extends RegistrationScreenEvent {
  final String code;

  TypeSmsCodeEvent(this.code);
}

class GetCodeEvent extends RegistrationScreenEvent {}

class UpdateTimerEvent extends RegistrationScreenEvent {
  final int seconds;

  UpdateTimerEvent(this.seconds);
}

class CheckSmsCodeEvent extends RegistrationScreenEvent {}

class NavigateNextScreenEvent extends RegistrationScreenEvent {}
