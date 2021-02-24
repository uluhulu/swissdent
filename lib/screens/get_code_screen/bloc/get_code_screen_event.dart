class GetCodeScreenEvent {}

class TypeNumberEvent extends GetCodeScreenEvent {
  final String number;

  TypeNumberEvent(this.number);
}

class TypeSmsCodeEvent extends GetCodeScreenEvent {
  final String code;

  TypeSmsCodeEvent(this.code);
}

class GetCodeEvent extends GetCodeScreenEvent {}

class UpdateTimerEvent extends GetCodeScreenEvent {
  final int seconds;

  UpdateTimerEvent(this.seconds);
}

class CheckSmsCodeEvent extends GetCodeScreenEvent {}

class NavigateNextRegistrationScreenEvent extends GetCodeScreenEvent {}
class ConfirmCodeEvent extends GetCodeScreenEvent {}

