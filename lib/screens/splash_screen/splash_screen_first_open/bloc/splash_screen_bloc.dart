import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swissdent/screens/splash_screen/splash_screen_first_open/bloc/splash_screen_event.dart';
import 'package:swissdent/screens/splash_screen/splash_screen_first_open/bloc/splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenState()) {
    initNavigate();
  }

  @override
  Stream<SplashScreenState> mapEventToState(SplashScreenEvent event) async* {
    yield* mapNavigateEvent(event);
  }

  Stream<SplashScreenState> mapNavigateEvent(SplashScreenEvent event) async* {
    if (event is SplashNavigateEvent) {
      yield SplashNavigateState();
    }
  }

  void initNavigate() async {
    await Future.delayed(Duration(seconds: 2));
    add(SplashNavigateEvent());
  }
}
