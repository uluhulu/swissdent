class RestoreScreenState{
  final bool restoreButtonIsAvailable;

  RestoreScreenState({this.restoreButtonIsAvailable});
}
class RestoreSucceedState extends RestoreScreenState{
  final String phoneNumber;
  RestoreSucceedState( {this.phoneNumber,
    bool restoreButtonIsAvailable,
  }) : super(
    restoreButtonIsAvailable: restoreButtonIsAvailable,
  );
}
class RestoreNotSucceedState extends RestoreScreenState{
  RestoreNotSucceedState({
    bool restoreButtonIsAvailable,
  }) : super(
    restoreButtonIsAvailable: restoreButtonIsAvailable,
  );
}