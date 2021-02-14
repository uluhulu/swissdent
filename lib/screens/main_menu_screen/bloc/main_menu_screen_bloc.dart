import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swissdent/screens/main_menu_screen/bloc/main_menu_screen_event.dart';

class MainMenuScreenBloc extends Bloc<MainMenuScreenEvent,MainMenuScreenEvent>{
  MainMenuScreenBloc(initialState) : super(initialState);

  @override
  Stream<MainMenuScreenEvent> mapEventToState(MainMenuScreenEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }


}