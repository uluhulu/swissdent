import 'package:swissdent/data/model/user_info_response.dart';
import 'package:swissdent/data/sign_in/repository/sign_in_repository.dart';
import 'package:swissdent/data/user_info/repository/user_info_repository.dart';

class UserInfoInteractor{
  final UserInfoRepository userInfoRepository;
  final SignInRepository signInRepository;

  UserInfoInteractor({this.userInfoRepository,this.signInRepository,});
  ///Получить информацию о пользователе
  Future<UserInfoResponse> getUserInfo() async{
    return userInfoRepository.getUserInfo();
  }
  ///Обновление информации о пользователе
  Future<bool> updateUserInfo(String name, String surname, String email) async {
    return signInRepository.updateUserData(name, surname, email);
  }
  ///Обновление пароля
  Future<bool> updatePassword(String password) async {
    return signInRepository.updatePassword(password);
  }
}