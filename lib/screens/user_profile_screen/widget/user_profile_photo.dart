import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/paths.dart';

class UserProfilePhoto extends StatefulWidget {
  final String photoPath;
  final Function(String path) onPhotoSelect;

  const UserProfilePhoto({Key key, this.photoPath, this.onPhotoSelect}) : super(key: key);
  @override
  _UserProfilePhotoState createState() => _UserProfilePhotoState();
}

class _UserProfilePhotoState extends State<UserProfilePhoto> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: GestureDetector(
        onTap: (){
          final action = CupertinoActionSheet(
            title: Text(
              "Выбрать фото профиля",
              style: TextStyle(fontSize: 18),
            ),
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: Text("Камера"),
                isDefaultAction: true,
                onPressed: () async {
                  // await viewModel.getImage(ImageSource.camera);
                  // Navigator.pop(context);
                },
              ),
              CupertinoActionSheetAction(
                child: Text("Галлерея"),
                isDefaultAction: true,
                onPressed: () async {
                  // Navigator.pop(context);
                  // await viewModel.getImage(ImageSource.gallery);
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
  }
}
