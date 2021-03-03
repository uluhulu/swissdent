import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swissdent/data/user_info/interactor/user_info_interactor.dart';
import 'package:swissdent/managers/exception.dart';
import 'package:swissdent/screens/user_profile_screen/bloc/user_profile_screen_event.dart';
import 'package:swissdent/screens/user_profile_screen/bloc/user_profile_screen_state.dart';

class UserProfileScreenBloc
    extends Bloc<UserProfileScreenEvent, UserProfileScreenState> {
  final UserInfoInteractor userInfoInteractor;

  String name = '';
  String surname = '';
  String email = '';
  String phone = '';
  String imageUrl = '';

  String newPassword = '';
  String confirmNewPassword = '';

  bool saveButtonIsAvailable = false;

  UserProfileScreenBloc({this.userInfoInteractor, })
      : super(UserProfileScreenState(
      saveButtonIsAvailable: false,
  )) {
    _getUserData();
  }

  @override
  Stream<UserProfileScreenState> mapEventToState(
      UserProfileScreenEvent event) async* {
    yield* mapGetUserInfoEvent(event);
    yield* mapTypeNameEvent(event);
    yield* mapTypeSurnameEvent(event);
    yield* mapTypeEmailEvent(event);
    yield* mapTypeNewPasswordEvent(event);
    yield* mapTypeConfirmNewPasswordEvent(event);
  }

  Stream<UserProfileScreenState> mapGetUserInfoEvent(
      UserProfileScreenEvent event) async* {
    if (event is GetUserInfoEvent)
      yield GetUserInfoState(
        userName: name,
        userSurname: surname,
        userEmail: email,
        userPhoneNumber: phone,
        saveButtonIsAvailable: saveButtonIsAvailable
      );
  }

  Stream<UserProfileScreenState> mapTypeNameEvent(
      UserProfileScreenEvent event) async* {
    if (event is TypeNameEvent) {
      name = event.name;
      _checkFields();
      yield GetUserInfoState(
          userName: name,
          userSurname: surname,
          userEmail: email,
          userPhoneNumber: phone,
          saveButtonIsAvailable: saveButtonIsAvailable
      );
    }
  }

  Stream<UserProfileScreenState> mapTypeSurnameEvent(
      UserProfileScreenEvent event) async* {
    if (event is TypeSurnameEvent) {
      surname = event.surname;
      _checkFields();
      yield GetUserInfoState(
          userName: name,
          userSurname: surname,
          userEmail: email,
          userPhoneNumber: phone,
          saveButtonIsAvailable: saveButtonIsAvailable
      );
    }
  }

  Stream<UserProfileScreenState> mapTypeEmailEvent(
      UserProfileScreenEvent event) async* {
    if (event is TypeEmailEvent) {
      email = event.email;
      _checkFields();
      yield GetUserInfoState(
          userName: name,
          userSurname: surname,
          userEmail: email,
          userPhoneNumber: phone,
          saveButtonIsAvailable: saveButtonIsAvailable
      );
    }
  }

  Stream<UserProfileScreenState> mapTypeNewPasswordEvent(
      UserProfileScreenEvent event) async* {
    if (event is TypeNewPasswordEvent) {
      newPassword = event.newPassword;
      _checkFields();
      yield GetUserInfoState(
          userName: name,
          userSurname: surname,
          userEmail: email,
          userPhoneNumber: phone,
          saveButtonIsAvailable: saveButtonIsAvailable
      );
    }
  }

  Stream<UserProfileScreenState> mapTypeConfirmNewPasswordEvent(
      UserProfileScreenEvent event) async* {
    if (event is TypeConfirmNewPasswordEvent) {
      confirmNewPassword = event.confirmNewPassword;
      _checkFields();
      yield GetUserInfoState(
          userName: name,
          userSurname: surname,
          userEmail: email,
          userPhoneNumber: phone,
          saveButtonIsAvailable: saveButtonIsAvailable
      );
    }
  }
  Stream<UserProfileScreenState> mapSaveChangesEvent(
      UserProfileScreenEvent event) async* {
    if (event is SaveChangesEvent) {

    }
  }


  void _getUserData() async {
    try {
      final response = await userInfoInteractor.getUserInfo();
      name = response.name;
      surname = response.surname;
      email = response.email;
      phone = response.phone.substring(2);
      print('$phone');
      add(GetUserInfoEvent());
    } on NetworkException catch (e) {
      print("ошибка ${e.errorMessage}");
    }
  }
  void  _checkFields(){
    if (name.isNotEmpty && surname.isNotEmpty && newPassword == confirmNewPassword){
      saveButtonIsAvailable = true;
    }else {

    }
  }

}
