class MainMenuScreenState{}
class GetUserInfoState extends MainMenuScreenState{
  final String userName;
  final String userSurname;
  final String userEmail;

  GetUserInfoState({this.userName, this.userSurname, this.userEmail});
}
class GetCartInfoState extends MainMenuScreenState{
  final int productsCount;

  GetCartInfoState(this.productsCount);
}
class CartNavigateState extends MainMenuScreenState{}
class ChartNavigateState extends MainMenuScreenState{}
class PersonalCabinetNavigateState extends MainMenuScreenState{}
class ServicesNavigateState extends MainMenuScreenState{}
class ProductsNavigateState extends MainMenuScreenState{}
class TeamNavigateState extends MainMenuScreenState{}
class HelpNavigateState extends MainMenuScreenState{}
class EmergencyCallState extends MainMenuScreenState{}