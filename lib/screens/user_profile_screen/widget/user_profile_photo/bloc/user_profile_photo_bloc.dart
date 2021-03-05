import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swissdent/data/user_info/interactor/user_info_interactor.dart';
import 'package:swissdent/screens/user_profile_screen/widget/user_profile_photo/bloc/user_profile_photo_event.dart';
import 'package:swissdent/screens/user_profile_screen/widget/user_profile_photo/bloc/user_profile_photo_state.dart';

class UserProfilePhotoBloc
    extends Bloc<UserProfilePhotoEvent, UserProfilePhotoState> {
  final UserInfoInteractor userInfoInteractor;

  UserProfilePhotoBloc({this.userInfoInteractor})
      : super(UserProfilePhotoState());

  @override
  Stream<UserProfilePhotoState> mapEventToState(
      UserProfilePhotoEvent event) async* {
    yield* mapOpenCameraEvent(event);
    yield* mapOpenGalleryEvent(event);
  }

  Stream<UserProfilePhotoState> mapOpenCameraEvent(
      UserProfilePhotoEvent event) async* {
    if (event is OpenCameraEvent) {
      yield OpenCameraState();
    }
  }

  Stream<UserProfilePhotoState> mapOpenGalleryEvent(
      UserProfilePhotoEvent event) async* {
    if (event is OpenGalleryEvent) {
      yield OpenGalleryState();
    }
  }
}
