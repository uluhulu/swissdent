import 'package:flutter/material.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/strings.dart';

/// Splash screen logo
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=1%3A5
class SplashLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildLogo(),
    );
  }

  Widget _buildLogo() {
    return Transform.translate(
      offset: Offset(0, -100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            logoSplashScreenPath,
            width: 170,
            height: 154,
          ),
          SizedBox(
            height: 25.85,
          ),
          Image.asset(
            textSplashScreenPath,
            width: 195,
            height: 48,
          )
        ],
      ),
    );
  }
}
