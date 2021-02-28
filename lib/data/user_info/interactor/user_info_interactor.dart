import 'package:swissdent/data/model/user_info_response.dart';
import 'package:swissdent/data/user_info/repository/user_info_repository.dart';

class UserInfoInteractor{
  final UserInfoRepository repository;

  UserInfoInteractor({this.repository});

  Future<UserInfoResponse> getUserInfo() async{
    return repository.getUserInfo();
  }

}