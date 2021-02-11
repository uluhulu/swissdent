import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swissdent/screens/registration_screen/bloc/registration_screen_state.dart';
import 'package:swissdent/screens/registration_screen/bloc/registration_screen_event.dart';

class RegistrationScreenBloc
    extends Bloc<RegistrationScreenEvent, RegistrationScreenState> {
  String name = '';
  String surname = '';
  String password = '';
  String passwordConfirmation = '';

  RegistrationScreenBloc() : super(RegistrationScreenState());

  @override
  Stream<RegistrationScreenState> mapEventToState(
      RegistrationScreenEvent event) async* {
    yield* mapTypeNameEvent(event);
    yield* mapTypeSurNameEvent(event);
  }

  Stream<RegistrationScreenState> mapTypeNameEvent(
      RegistrationScreenEvent event) async* {
    if (event is TypeNameEvent) {
      name = event.name;
      yield registrationValidation();
    }
  }

  Stream<RegistrationScreenState> mapTypeSurNameEvent(
      RegistrationScreenEvent event) async* {
    if (event is TypeSurnameEvent) {
      surname = event.surname;
      yield registrationValidation();
    }
  }

  Stream<RegistrationScreenState> mapTypePasswordEvent(
      RegistrationScreenEvent event) async* {
    if (event is TypePasswordEvent) {
      password = event.password;
      yield passwordValidation();
    }
  }
  Stream<RegistrationScreenState> mapTypePasswordConfirmationEvent(
      RegistrationScreenEvent event) async* {
    if (event is TypePasswordConfirmation) {
      passwordConfirmation = event.passwordConfirmation;
      yield passwordValidation();
    }
  }

  RegistrationScreenState registrationValidation() {
    if (name.isNotEmpty && surname.isNotEmpty) {
      return RegistrationButtonActive();
    }
    return RegistrationButtonNotActive();
  }
  RegistrationScreenState passwordValidation() {
    if (password == passwordConfirmation) {
      return NavigateNext();
    }
    return PaswordNotConfirmed();
  }
}
