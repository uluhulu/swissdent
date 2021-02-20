import 'package:flutter/material.dart';
import 'package:swissdent/constants/paths.dart';

class HelpBackgroundWave extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -55,
      left:-30,
      child: Image.asset(
        decorSplashWavePath,
        width: 449,
        height: 245,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}