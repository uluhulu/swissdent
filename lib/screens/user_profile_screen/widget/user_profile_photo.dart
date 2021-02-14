import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/paths.dart';

class UserProfilePhoto extends StatelessWidget {
  final String photoPath;

  const UserProfilePhoto({
    Key key,
    this.photoPath = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
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
              child: photoPath.isNotEmpty
                  ? Container(
                      // margin: EdgeInsets.all(8),
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(photoPath),
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
    );
  }
}
