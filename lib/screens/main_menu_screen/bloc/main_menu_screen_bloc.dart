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
    yield* mapUserInfoNavigateEvent(event);
    yield* mapCartNavigateEvent(event);
    yield* mapPersonalCabinetNavigateEvent(event);
    yield* mapServicesNavigateEvent(event);
    yield* mapProductsNavigateEvent(event);
    yield* mapTeamNavigateEvent(event);
    yield* mapHelpNavigateEvent(event);
    yield* mapHelpNavigateEvent(event);
    yield* mapChatNavigateEvent(event);
  }

  void _getUserData() async {
    try {
      final response = await userInfoInteractor.getUserInfo();
      name = response.name;
      surname = response.surname;
      email = response.email;
      print('email $email');
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

  Stream<MainMenuScreenState> mapUserInfoNavigateEvent(
      MainMenuScreenEvent event) async* {
    if (event is UserInfoNavigateEvent) {
      yield (UserInfoNavigateState(
          userName: name, userSurname: surname, userEmail: email));
    }
  }

  Stream<MainMenuScreenState> mapCartNavigateEvent(
      MainMenuScreenEvent event) async* {
    if (event is CartNavigateEvent) {
      yield (CartNavigateState(
          userName: name, userSurname: surname, userEmail: email));
    }
  }

  Stream<MainMenuScreenState> mapPersonalCabinetNavigateEvent(
      MainMenuScreenEvent event) async* {
    if (event is PersonalCabinetNavigateEvent) {
      yield (PersonalCabinetNavigateState(
          userName: name, userSurname: surname, userEmail: email));
    }
  }

  Stream<MainMenuScreenState> mapServicesNavigateEvent(
      MainMenuScreenEvent event) async* {
    if (event is ServicesNavigateEvent) {
      yield (ServicesNavigateState(
          userName: name, userSurname: surname, userEmail: email));
    }
  }

  Stream<MainMenuScreenState> mapProductsNavigateEvent(
      MainMenuScreenEvent event) async* {
    if (event is ProductsNavigateEvent) {
      yield (ProductsNavigateState(
          userName: name, userSurname: surname, userEmail: email));
    }
  }

  Stream<MainMenuScreenState> mapTeamNavigateEvent(
      MainMenuScreenEvent event) async* {
    if (event is TeamNavigateEvent) {
      yield (TeamNavigateState(
          userName: name, userSurname: surname, userEmail: email));
    }
  }

  Stream<MainMenuScreenState> mapHelpNavigateEvent(
      MainMenuScreenEvent event) async* {
    if (event is HelpNavigateEvent) {
      yield (HelpNavigateState(
          userName: name, userSurname: surname, userEmail: email));
    }
  }
  Stream<MainMenuScreenState> mapChatNavigateEvent(
      MainMenuScreenEvent event) async* {
    if (event is ChatNavigateEvent) {
      yield (ChatNavigateState(
          userName: name, userSurname: surname, userEmail: email));
    }
  }
}
