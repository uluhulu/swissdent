import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swissdent/screens/registration_screen/bloc_registration_screen/registration_screen_state.dart';
import 'package:swissdent/screens/registration_screen/bloc_registration_screen/registration_screen_event.dart';

class RegistrationScreenBloc
    extends Bloc<RegistrationScreenEvent, RegistrationScreenState> {
  String name = '';
  String surname = '';
  String password = '';
  String email = '';
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
  Stream<RegistrationScreenState> mapTypeEmailEvent(
      RegistrationScreenEvent event) async* {
    if (event is TypeEmailEvent) {
      email = event.email;
    }
  }


  RegistrationScreenState registrationValidation() {
    if (name.isNotEmpty && surname.isNotEmpty) {
      return RegistrationButtonActive();
    }
    return RegistrationButtonNotActive();
  }

}
