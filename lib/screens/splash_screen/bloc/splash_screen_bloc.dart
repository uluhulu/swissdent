import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swissdent/screens/splash_screen/bloc/splash_screen_event.dart';
import 'package:swissdent/screens/splash_screen/bloc/splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenState());

  @override
  Stream<SplashScreenState> mapEventToState(SplashScreenEvent event) async* {
    yield* mapNavigateState();
  }

  Stream<SplashScreenState> mapNavigateState() async* {
    await Future.delayed(Duration(seconds: 2));
    yield NavigateRegistrationScreenState();
  }
}
