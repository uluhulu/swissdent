class RegistrationScreenState {}
class RegistrationButtonActive extends RegistrationScreenState{}
class RegistrationButtonNotActive extends RegistrationScreenState{}
class RegistrationSucceedState extends RegistrationScreenState{}
class RegistrationNotSucceedState extends RegistrationScreenState{
  final String errorMessage;

  RegistrationNotSucceedState({this.errorMessage});
}
