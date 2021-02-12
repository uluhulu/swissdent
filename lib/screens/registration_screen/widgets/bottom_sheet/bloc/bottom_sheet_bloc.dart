import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swissdent/screens/registration_screen/widgets/bottom_sheet/bloc/bottom_sheet_event.dart';

import 'bottom_sheet_state.dart';

class BottomSheetBloc extends Bloc<BottomSheetEvent,BottomSheetState>{
  String password = '';
  String passwordConfirmation = '';

  BottomSheetBloc() : super(BottomSheetState());

  @override
  Stream<BottomSheetState> mapEventToState(BottomSheetEvent event) async* {
    yield* mapTypePasswordEvent(event);
    yield* mapTypePasswordConfirmationEvent(event);
  }
  Stream<BottomSheetState> mapTypePasswordEvent(
      BottomSheetEvent event) async* {
    if (event is TypePasswordEvent) {
      password = event.password;
      // print('TypePasswordEvent');
      // yield passwordValidation();
    }
  }
  Stream<BottomSheetState> mapTypePasswordConfirmationEvent(
      BottomSheetEvent event) async* {
    if (event is TypePasswordConfirmation) {
      passwordConfirmation = event.passwordConfirmation;
      print('TypePasswordConfirmation');
      yield passwordValidation();
    }
  }
  BottomSheetState passwordValidation() {
    if (password == passwordConfirmation && password.isNotEmpty && passwordConfirmation.isNotEmpty) {
      // print("Navigate");
      return NavigateNext();
    }

    return PaswordNotConfirmed();
  }


}