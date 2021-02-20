import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/paths.dart';

///circle avatar
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=3%3A2715
class RoundedAvatar extends StatelessWidget {
  final String photoPath;

  const RoundedAvatar({
    Key key,
    this.photoPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color: circleAvatarColor,
      ),
      child: photoPath != null
          ? Container(
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
                width: 22,
                height: 22,
              ),
            ),
    );
  }
}
