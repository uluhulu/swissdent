import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/data/user_info/interactor/user_info_interactor.dart';
import 'package:swissdent/screens/user_profile_screen/widget/user_profile_photo/bloc/user_profile_photo_bloc.dart';
import 'package:swissdent/screens/user_profile_screen/widget/user_profile_photo/bloc/user_profile_photo_event.dart';
import 'package:swissdent/screens/user_profile_screen/widget/user_profile_photo/bloc/user_profile_photo_state.dart';

import '../../../../di.dart';

class UserProfilePhoto extends StatefulWidget {
  final String photoPath;
  final Function(String path) onPhotoSelect;

  const UserProfilePhoto({Key key, this.photoPath, this.onPhotoSelect})
      : super(key: key);

  @override
  _UserProfilePhotoState createState() => _UserProfilePhotoState();
}

class _UserProfilePhotoState extends State<UserProfilePhoto> {
  final StreamController<PickedFile> pickedImageController = StreamController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return UserProfilePhotoBloc(
          userInfoInteractor: getIt<UserInfoInteractor>(),
        );
      },
      child: BlocConsumer<UserProfilePhotoBloc,UserProfilePhotoState>(
        listener: (BuildContext context, state){
          if(state is OpenCameraState) {
             getImage(ImageSource.camera);
          }
          if(state is OpenGalleryState) {
            getImage(ImageSource.gallery);
          }
        },
        builder:(BuildContext context, state){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: GestureDetector(
              onTap: () {
                final action = CupertinoActionSheet(
                  title: Text(
                    "Выбрать фото профиля",
                    style: TextStyle(fontSize: 18),
                  ),
                  actions: <Widget>[
                    CupertinoActionSheetAction(
                      child: Text("Камера"),
                      isDefaultAction: true,
                      onPressed: ()  {
                        _sendOpenCameraEvent(context);
                        // Navigator.pop(context);
                      },
                    ),
                    CupertinoActionSheetAction(
                      child: Text("Галлерея"),
                      isDefaultAction: true,
                      onPressed: ()  {
                        _sendOpenGalleryEvent(context);
                      },
                    )
                  ],
                  cancelButton: CupertinoActionSheetAction(
                    child: Text("Отмена"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                );
                showCupertinoModalPopup(
                    context: context, builder: (context) => action);
              },
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      width: 110,
                      height: 110,
                      decoration: new BoxDecoration(
                        color: circleAvatarColor,
                        shape: BoxShape.circle,
                      ),
                      child: widget.photoPath.isNotEmpty
                          ? Container(
// margin: EdgeInsets.all(8),
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(widget.photoPath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                          : Center(
                        child: Image.asset(
                          iconCamera,
                          width: 38,
                          height: 38,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: userProfilePhotoIconBackgroundColor,
                        ),
                        child: Center(
                          child: Image.asset(
                            iconCameraWhite,
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  void _sendOpenCameraEvent(BuildContext context){
    BlocProvider.of<UserProfilePhotoBloc>(context).add(OpenCameraEvent());
  }
  void _sendOpenGalleryEvent(BuildContext context){
    BlocProvider.of<UserProfilePhotoBloc>(context).add(OpenGalleryEvent());
  }
  Future getImage(ImageSource source) async {
    var image = await ImagePicker().getImage(source: source);
    widget.onPhotoSelect.call(image.path);
    // pickedImageController.add(image);
  }
}
