class UserProfileScreenEvent{}
class GetUserInfoEvent extends UserProfileScreenEvent{}
class TypeNameEvent extends UserProfileScreenEvent{
  final String name;

  TypeNameEvent(this.name);
}
class TypeSurnameEvent extends UserProfileScreenEvent{
  final String surname;

  TypeSurnameEvent(this.surname);
}
class TypeEmailEvent extends UserProfileScreenEvent{
  final String email;

  TypeEmailEvent(this.email);
}
class TypeNewPasswordEvent extends UserProfileScreenEvent{
  final String newPassword;

  TypeNewPasswordEvent(this.newPassword);
}
class TypeConfirmNewPasswordEvent extends UserProfileScreenEvent{
  final String confirmNewPassword;

  TypeConfirmNewPasswordEvent(this.confirmNewPassword);
}
class SaveChangesEvent extends UserProfileScreenEvent{

}
