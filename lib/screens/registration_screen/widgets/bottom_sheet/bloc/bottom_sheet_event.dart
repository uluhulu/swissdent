class BottomSheetEvent{}

class TypePasswordEvent extends BottomSheetEvent{
  final String password;

  TypePasswordEvent(this.password);
}
class TypePasswordConfirmation extends BottomSheetEvent{
  final String passwordConfirmation;

  TypePasswordConfirmation(this.passwordConfirmation);
}