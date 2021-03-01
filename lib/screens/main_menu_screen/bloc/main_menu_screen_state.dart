class MainMenuScreenState {
  final String userName;
  final String userSurname;
  final String userEmail;

  MainMenuScreenState({this.userName, this.userSurname, this.userEmail});
}

class GetUserInfoState extends MainMenuScreenState {
  GetUserInfoState({String userName, String userSurname, String userEmail})
      : super(
          userName: userName,
          userSurname: userSurname,
          userEmail: userEmail,
        );
}

class GetCartInfoState extends MainMenuScreenState {
  final int productsCount;

  GetCartInfoState(this.productsCount);
}
class UserInfoNavigateState extends MainMenuScreenState {
  UserInfoNavigateState({String userName, String userSurname, String userEmail})
      : super(
    userName: userName,
    userSurname: userSurname,
    userEmail: userEmail,
  );
}

class CartNavigateState extends MainMenuScreenState {
  CartNavigateState({String userName, String userSurname, String userEmail})
      : super(
    userName: userName,
    userSurname: userSurname,
    userEmail: userEmail,
  );
}

class ChatNavigateState extends MainMenuScreenState {
  ChatNavigateState({String userName, String userSurname, String userEmail})
      : super(
  userName: userName,
  userSurname: userSurname,
  userEmail: userEmail,
  );
}

class PersonalCabinetNavigateState extends MainMenuScreenState {
  PersonalCabinetNavigateState({String userName, String userSurname, String userEmail})
      : super(
    userName: userName,
    userSurname: userSurname,
    userEmail: userEmail,
  );
}

class ServicesNavigateState extends MainMenuScreenState {
  ServicesNavigateState({String userName, String userSurname, String userEmail})
      : super(
    userName: userName,
    userSurname: userSurname,
    userEmail: userEmail,
  );
}

class ProductsNavigateState extends MainMenuScreenState {
  ProductsNavigateState({String userName, String userSurname, String userEmail})
      : super(
    userName: userName,
    userSurname: userSurname,
    userEmail: userEmail,
  );
}

class TeamNavigateState extends MainMenuScreenState {
  TeamNavigateState({String userName, String userSurname, String userEmail})
      : super(
    userName: userName,
    userSurname: userSurname,
    userEmail: userEmail,
  );
}

class HelpNavigateState extends MainMenuScreenState {
  HelpNavigateState({String userName, String userSurname, String userEmail})
      : super(
    userName: userName,
    userSurname: userSurname,
    userEmail: userEmail,
  );
}

class EmergencyCallState extends MainMenuScreenState {
  EmergencyCallState({String userName, String userSurname, String userEmail})
      : super(
    userName: userName,
    userSurname: userSurname,
    userEmail: userEmail,
  );
}
