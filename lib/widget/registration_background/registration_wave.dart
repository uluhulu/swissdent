import 'package:flutter/material.dart';
import 'package:swissdent/constants/paths.dart';

class RegistrationWave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -20,
      left:-40,
      child: Image.asset(
        decorSplashWavePath,
        width: 324,
        height: 177,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}