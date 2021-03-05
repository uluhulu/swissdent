class UserProfileScreenState {
  final String userName;
  final String userSurname;
  final String userEmail;
  final String userPhoneNumber;
  final String imageUrl;
  final String photoPath;
  final bool saveButtonIsAvailable;

  UserProfileScreenState({
    this.userName,
    this.userSurname,
    this.userEmail,
    this.userPhoneNumber,
    this.imageUrl,
    this.saveButtonIsAvailable,
    this.photoPath,
  });
}

class GetUserInfoState extends UserProfileScreenState {
  GetUserInfoState({
    String userName,
    String userSurname,
    String userEmail,
    String userPhoneNumber,
    String imageUrl,
    String photoPath,
    bool saveButtonIsAvailable,
  }) : super(
            userName: userName,
            userSurname: userSurname,
            userEmail: userEmail,
            userPhoneNumber: userPhoneNumber,
            imageUrl: imageUrl,
            saveButtonIsAvailable: saveButtonIsAvailable,
            photoPath: photoPath);
}
