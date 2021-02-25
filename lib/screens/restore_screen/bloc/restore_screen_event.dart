class RestoreScreenEvent{}
class TypeNumberEvent extends RestoreScreenEvent {
  final String number;

  TypeNumberEvent(this.number);
}
class RestorePasswordEvent extends RestoreScreenEvent{}