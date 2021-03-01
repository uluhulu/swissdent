import 'package:swissdent/constants/url.dart';
import 'package:swissdent/data/model/user_info_response.dart';
import 'package:swissdent/managers/api_manager.dart';
import 'package:swissdent/screens/main_menu_screen/widget/user_card/widget/user_info/user_info.dart';

class UserInfoRepository {
  final ApiManager apiManager;

  UserInfoRepository({this.apiManager});

  ///Получение информации о пользователе
  Future<UserInfoResponse> getUserInfo() async {
    final response = await apiManager.get(userInfoUrlTest);
    print('${UserInfoResponse.fromJson(response.result).email}');
    return UserInfoResponse.fromJson(response.result);
  }
}