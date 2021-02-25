import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:swissdent/data/sign_in/interactor/sign_in_interactor.dart';
import 'package:swissdent/screens/log_in_screen/bloc/log_in_screen_event.dart';
import 'package:swissdent/screens/log_in_screen/bloc/log_in_screen_state.dart';
import 'package:swissdent/util/mask_formatter.dart';

class LogInScreenBloc extends Bloc<LogInScreenEvent,LogInScreenState>{
  String phoneNumber = '';
  String password = '';
  bool logInButtonIsAvailable = false;

  final SignInInteractor signInInteractor;
  LogInScreenBloc({this.signInInteractor}) : super(LogInScreenState(
    logInButtonIsAvailable: false
  ));
  @override
  Stream<LogInScreenState> mapEventToState(LogInScreenEvent event) async*{
    yield* mapTypeNumberEvent(event);
    yield* mapTypePasswordEvent(event);
    yield* mapTapOnLogInButtonEvent(event);
    yield* mapNavigateMainMenuScreenEvent(event);
    yield* mapNavigateRegistrationScreenEvent(event);
    yield* mapNavigateRestoreScreenEvent(event);
  }

  Stream<LogInScreenState> mapTypeNumberEvent(LogInScreenEvent event) async*{
    if(event is TypeNumberEvent){
      phoneNumber = event.number;
      yield LogInScreenState(
        logInButtonIsAvailable: logInButtonIsAvailable
      );
    }
  }

  Stream<LogInScreenState> mapTypePasswordEvent(LogInScreenEvent event) async*{
    if(event is TypePasswordEvent){
      password = event.password;
      logInButtonIsAvailableCheck();
      yield LogInScreenState(
          logInButtonIsAvailable: logInButtonIsAvailable
      );
    }
  }
  Stream<LogInScreenState> mapTapOnLogInButtonEvent(LogInScreenEvent event) async*{
    if(event is TapOnLogInButtonEvent){
      final logInResponse = await signInInteractor.authorization(maskFormatter.maskText(phoneNumber), password);
      if(logInResponse){
        add(NavigateMainMenuScreenEvent());
      }else{
        print('ошибка запроса логина');
      }
    }
  }
  Stream<LogInScreenState> mapNavigateMainMenuScreenEvent(LogInScreenEvent event) async*{
    if(event is NavigateMainMenuScreenEvent){
      yield NavigateMainMenuScreenState(
          logInButtonIsAvailable: logInButtonIsAvailable,
      );
      }
  } 
  Stream<LogInScreenState> mapNavigateRegistrationScreenEvent(LogInScreenEvent event) async*{
    if(event is NavigateRegistrationScreenEvent){
      yield NavigateRegistrationScreenState(
        logInButtonIsAvailable: logInButtonIsAvailable,
      );
      }
  }
  Stream<LogInScreenState> mapNavigateRestoreScreenEvent(LogInScreenEvent event) async*{
    if(event is NavigateRestoreScreenEvent){
      yield NavigateRestoreScreenState(
        logInButtonIsAvailable: logInButtonIsAvailable,
      );
      }
  }
  void logInButtonIsAvailableCheck() {
    if (phoneNumber.length == 10 && password.length >= 1) {
      logInButtonIsAvailable = true;
    } else {
      logInButtonIsAvailable = false;
    }
  }
  
}