class LogInScreenState {
  final bool logInButtonIsAvailable;

  LogInScreenState({this.logInButtonIsAvailable});
}
class NavigateMainMenuScreenState extends LogInScreenState{
  NavigateMainMenuScreenState({
    bool logInButtonIsAvailable,
}): super(
      logInButtonIsAvailable: logInButtonIsAvailable,
  );
}
class NavigateRegistrationScreenState extends LogInScreenState{
  NavigateRegistrationScreenState({
    bool logInButtonIsAvailable,
}): super(
      logInButtonIsAvailable: logInButtonIsAvailable,
  );
}
class NavigateRestoreScreenState extends LogInScreenState{
  NavigateRestoreScreenState({
    bool logInButtonIsAvailable,
}): super(
      logInButtonIsAvailable: logInButtonIsAvailable,
  );
}
