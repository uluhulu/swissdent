import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:swissdent/data/sign_in/interactor/sign_in_interactor.dart';
import 'package:swissdent/screens/restore_screen/bloc/restore_screen_event.dart';
import 'package:swissdent/screens/restore_screen/bloc/restore_screen_state.dart';

class RestoreScreenBloc extends Bloc<RestoreScreenEvent, RestoreScreenState>{
  String phoneNumber = '';
  bool restoreButtonIsAvailable = false;

  final SignInInteractor signInInteractor;

  static final numPrefix = '+7';
  final maskFormatter = new MaskTextInputFormatter(
    mask: '$numPrefix(###)###-##-##',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );
  RestoreScreenBloc({this.signInInteractor}) : super(RestoreScreenState(
    restoreButtonIsAvailable: false,
  ));

  @override
  Stream<RestoreScreenState> mapEventToState(RestoreScreenEvent event) async*{
    yield* mapTypeNumberEvent(event);
    yield* mapRestorePasswordEvent(event);
  }
  @override
  Stream<RestoreScreenState> mapTypeNumberEvent(
      RestoreScreenEvent event,
      ) async* {
    if (event is TypeNumberEvent) {
      phoneNumber = event.number;
      restoreButtonAvailableCheck();
      yield RestoreScreenState(
        restoreButtonIsAvailable: restoreButtonIsAvailable,
      );
    }
  }
  @override
  Stream<RestoreScreenState> mapRestorePasswordEvent(
      RestoreScreenEvent event,
      ) async* {
    if (event is RestorePasswordEvent) {
      final restoreResponse = await signInInteractor.restorePassword(maskFormatter.maskText(phoneNumber));
      if(restoreResponse){
        yield RestoreSucceedState(
          restoreButtonIsAvailable: restoreButtonIsAvailable,
        );
      } else
      yield RestoreNotSucceedState(
        restoreButtonIsAvailable: restoreButtonIsAvailable,
      );
    }
  }
  void restoreButtonAvailableCheck() {
    if (phoneNumber.length == 10) {
      restoreButtonIsAvailable = true;
    } else {
      restoreButtonIsAvailable = false;
    }
  }

}