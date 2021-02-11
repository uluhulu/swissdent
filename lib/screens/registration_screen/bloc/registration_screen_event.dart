class RegistrationScreenEvent{}

class TypeNameEvent extends RegistrationScreenEvent{
  final String name;

  TypeNameEvent(this.name);
}

class TypeSurnameEvent extends RegistrationScreenEvent{
  final String surname;

  TypeSurnameEvent(this.surname);
}

class TypePasswordEvent extends RegistrationScreenEvent{
  final String password;

  TypePasswordEvent(this.password);
}
class TypePasswordConfirmation extends RegistrationScreenEvent{
  final String passwordConfirmation;

  TypePasswordConfirmation(this.passwordConfirmation);
}
