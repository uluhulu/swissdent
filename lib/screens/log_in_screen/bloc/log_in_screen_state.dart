class LogInScreenState {
  final bool logInButtonIsAvailable;
  final String phoneNumber;

  LogInScreenState({this.phoneNumber, this.logInButtonIsAvailable});
}

class NavigateMainMenuScreenState extends LogInScreenState {
  NavigateMainMenuScreenState({
    bool logInButtonIsAvailable,
    String phoneNumber,
  }) : super(
          logInButtonIsAvailable: logInButtonIsAvailable,
          phoneNumber: phoneNumber,
        );
}

class NavigateRegistrationScreenState extends LogInScreenState {
  NavigateRegistrationScreenState({
    bool logInButtonIsAvailable,
    String phoneNumber,
  }) : super(
          logInButtonIsAvailable: logInButtonIsAvailable,
          phoneNumber: phoneNumber,
        );
}

class NavigateRestoreScreenState extends LogInScreenState {
  NavigateRestoreScreenState({
    bool logInButtonIsAvailable,
    String phoneNumber,
  }) : super(
          logInButtonIsAvailable: logInButtonIsAvailable,
          phoneNumber: phoneNumber,
        );
}

class UpdateNumberState extends LogInScreenState {
  UpdateNumberState({
    bool logInButtonIsAvailable,
    String phoneNumber,
  }) : super(
          logInButtonIsAvailable: logInButtonIsAvailable,
          phoneNumber: phoneNumber,
        );
}
