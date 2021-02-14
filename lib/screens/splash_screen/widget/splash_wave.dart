import 'package:flutter/material.dart';
import 'package:swissdent/constants/paths.dart';

/// splash screen wave decor
/// https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=1%3A5
class SplashWave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -90,
      left: -90,
      child: Image.asset(
        decorSplashWavePath,
        width: 797,
        height: 435,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
