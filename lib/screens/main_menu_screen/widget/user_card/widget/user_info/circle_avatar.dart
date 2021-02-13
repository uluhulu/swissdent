import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/paths.dart';

///circle avatar
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=3%3A2715
class RoundedAvatar extends StatelessWidget {
  final String photoPath;

  const RoundedAvatar({
    Key key,
    this.photoPath =
        'https://cdn009.mndcdn.net/photo/c/4/b/2fc1947a75b55b357cade348618085ab_view.jpg',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color: circleAvatarColor,
      ),
      child: photoPath.isNotEmpty
          ? Container(
              // margin: EdgeInsets.all(8),
              width: 60,
              height: 60,
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
