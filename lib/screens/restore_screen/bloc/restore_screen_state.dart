class RestoreScreenState {
  final bool restoreButtonIsAvailable;
  final String phoneNumber;

  RestoreScreenState({
    this.restoreButtonIsAvailable,
    this.phoneNumber,
  });
}

class RestoreSucceedState extends RestoreScreenState {
  RestoreSucceedState({
    String phoneNumber,
    bool restoreButtonIsAvailable,
  }) : super(
          restoreButtonIsAvailable: restoreButtonIsAvailable,
          phoneNumber: phoneNumber,
        );
}

class RestoreNotSucceedState extends RestoreScreenState {
  final String errorMessage;

  RestoreNotSucceedState({
    bool restoreButtonIsAvailable,
    this.errorMessage,
  }) : super(
          restoreButtonIsAvailable: restoreButtonIsAvailable,
        );
}
