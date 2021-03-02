class UserProfileScreenState {
  final String userName;
  final String userSurname;
  final String userEmail;
  final String userPhoneNumber;

  UserProfileScreenState({
    this.userName,
    this.userSurname,
    this.userEmail,
    this.userPhoneNumber,
  });
}

class GetUserInfoState extends UserProfileScreenState {
  GetUserInfoState({
    String userName,
    String userSurname,
    String userEmail,
    String userPhoneNumber,
  }) : super(
          userName: userName,
          userSurname: userSurname,
          userEmail: userEmail,
          userPhoneNumber: userPhoneNumber,
        );
}
