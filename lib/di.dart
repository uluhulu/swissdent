import 'package:get_it/get_it.dart';
import 'package:swissdent/data/sign_in/interactor/sign_in_interactor.dart';
import 'package:swissdent/data/sign_in/repository/sign_in_repository.dart';
import 'package:swissdent/data/user_info/interactor/user_info_interactor.dart';
import 'package:swissdent/managers/api_manager.dart';

import 'data/user_info/repository/user_info_repository.dart';

final getIt = GetIt.instance;

void initDi() {
  getIt.registerSingleton<ApiManager>(
    ApiManager(),
  );
  getIt.registerSingleton<SignInRepository>(
    SignInRepository(
      apiManager: getIt<ApiManager>(),
    ),
  );
  getIt.registerSingleton<SignInInteractor>(
    SignInInteractor(
      repository: getIt<SignInRepository>(),
    ),
  );
  getIt.registerSingleton<UserInfoInteractor>(
    UserInfoInteractor(
      repository: getIt<UserInfoRepository>(),
    ),
  );
}
