import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swissdent/data/user_info/interactor/user_info_interactor.dart';
import 'package:swissdent/managers/exception.dart';
import 'package:swissdent/screens/main_menu_screen/bloc/main_menu_screen_event.dart';
import 'package:swissdent/screens/main_menu_screen/bloc/main_menu_screen_state.dart';

class MainMenuScreenBloc
    extends Bloc<MainMenuScreenEvent, MainMenuScreenState> {
  String name = '';
  String surname = '';
  String email = '';
  final UserInfoInteractor userInfoInteractor;

  MainMenuScreenBloc({
    this.userInfoInteractor,
  }) : super(MainMenuScreenState()) {
    _getUserData();
  }

  @override
  Stream<MainMenuScreenState> mapEventToState(
      MainMenuScreenEvent event) async* {
    // TODO: implement mapEventToState
    yield* mapGetUserInfoEvent(event);
  }

  void _getUserData() async {
    try {
      final response = await userInfoInteractor.getUserInfo();
      print("пользователь получен ${response.name}");
      name = response.name;
      surname = response.surname;
      email = response.email;
      add(GetUserInfoEvent());
    } on NetworkException catch (e) {
      print("ошибка ${e.errorMessage}");
    }
  }

  @override
  Stream<MainMenuScreenState> mapGetUserInfoEvent(
      MainMenuScreenEvent event) async* {
    if (event is GetUserInfoEvent) {
      yield (GetUserInfoState(
          userName: name, userSurname: surname, userEmail: email));
    }
  }
}
