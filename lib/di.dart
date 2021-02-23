import 'package:get_it/get_it.dart';
import 'package:swissdent/managers/api_manager.dart';

final getIt = GetIt.instance;

void initDi() {
  getIt.registerSingleton<ApiManager>(
    ApiManager(),
  );
}
