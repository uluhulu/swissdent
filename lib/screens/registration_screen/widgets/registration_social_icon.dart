import 'package:flutter/material.dart';

///social media icons registration
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=2%3A1378
class SocialIcon extends StatelessWidget {
  final String path;
  final Function() onIconTap;

  const SocialIcon({Key key, this.path, this.onIconTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onIconTap,
        child: Container(
          width: 32,
          height: 32,
          child: Image.asset(
            path,
          ),
        ));
  }
}
