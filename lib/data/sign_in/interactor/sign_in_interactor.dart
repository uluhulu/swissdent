import 'package:swissdent/data/model/register_code.dart';
import 'package:swissdent/data/model/token.dart';
import 'package:swissdent/data/sign_in/repository/sign_in_repository.dart';

/// бизнес-логика экрана логина и регистрациии
class SignInInteractor {
  final SignInRepository repository;

  SignInInteractor({this.repository});

  ///Запрос кода для телефона
  ///phone - номер телефона в формате "+*(***)***-**-**"
  Future<RegisterCode> register(String phone) async {
    return repository.register(phone);
  }

  ///Потверждение кода
  ///phone - номер телефона "+*(***)***-**-**"
  ///code - код подтверждения "* * * *"
  Future<bool> confirmCode(String phone, String code) async {
    return repository.confirmCode(phone, code);
  }

  ///Авторизация
  ///phone - номер телефона "+*(***)***-**-**"
  ///password - пароль
  Future<bool> authorization(String phone, String password) async {
    return repository.authorization(phone, password);
  }

  ///Обновление информации о пользователе
  Future<bool> updateUserInfo(String name, String surname, String email) async {
    return repository.updateUserData(name, surname, email);
  }

  ///Обновление пароля
  Future<bool> updatePassword(String password) async {
    return repository.updatePassword(password);
  }

  ///Восстановление пароля
  Future<RegisterCode> restorePassword(String phone) async {
    return repository.restorePassword(phone);
  }
}
