class LogInScreenEvent{}
class TypeNumberEvent extends LogInScreenEvent {
  final String number;

  TypeNumberEvent(this.number);
}
class TypePasswordEvent extends LogInScreenEvent {
  final String password;

  TypePasswordEvent(this.password);
}
class TapOnLogInButtonEvent extends LogInScreenEvent{}
class NavigateMainMenuScreenEvent extends LogInScreenEvent{}
class NavigateRegistrationScreenEvent extends LogInScreenEvent{}
class NavigateRestoreScreenEvent extends LogInScreenEvent{}
class PhoneUpdateEvent extends LogInScreenEvent{
  final String phoneNumber;

  PhoneUpdateEvent(this.phoneNumber);
}