class RegistrationScreenEvent{}

class TypeNameEvent extends RegistrationScreenEvent{
  final String name;

  TypeNameEvent(this.name);
}

class TypeSurnameEvent extends RegistrationScreenEvent{
  final String surname;

  TypeSurnameEvent(this.surname);
}

class TypeEmailEvent extends RegistrationScreenEvent{
  final String email;

  TypeEmailEvent(this.email);
}

