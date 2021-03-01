import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swissdent/data/sign_in/interactor/sign_in_interactor.dart';
import 'package:swissdent/managers/exception.dart';
import 'package:swissdent/screens/registration_screen/bloc_registration_screen/registration_screen_state.dart';
import 'package:swissdent/screens/registration_screen/bloc_registration_screen/registration_screen_event.dart';

class RegistrationScreenBloc
    extends Bloc<RegistrationScreenEvent, RegistrationScreenState> {
  String name = '';
  String surname = '';
  String password = '';
  String email = '';
  String passwordConfirmation = '';

  final SignInInteractor signInInteractor;

  RegistrationScreenBloc({this.signInInteractor})
      : super(RegistrationScreenState());

  @override
  Stream<RegistrationScreenState> mapEventToState(
      RegistrationScreenEvent event) async* {
    yield* mapTypeNameEvent(event);
    yield* mapTypeSurNameEvent(event);
    yield* mapTypeEmailEvent(event);
    yield* mapRegistrationEvent(event);
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
      print('type email: $email');
    }
  }

  Stream<RegistrationScreenState> mapRegistrationEvent(
      RegistrationScreenEvent event) async* {
    if (event is RegistrationEvent) {
      try {
        print('email to request: $email');
        final updateInfoResponse =
            await signInInteractor.updateUserInfo(name, surname, email);
        yield RegistrationSucceedState();
      } on NetworkException catch (e) {
        yield RegistrationNotSucceedState(
            errorMessage: e.customErrorMessage
        );
      }
    }
  }

  RegistrationScreenState registrationValidation() {
    if (name.isNotEmpty && surname.isNotEmpty) {
      return RegistrationButtonActive();
    }
    return RegistrationButtonNotActive();
  }
}
