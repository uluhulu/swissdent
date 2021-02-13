import 'dart:math';

import 'package:flutter/material.dart';
import 'package:swissdent/constants/paths.dart';

class AppBarWaveDecoration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Positioned(
      bottom: -30,
      left:-85,
      child: Image.asset(
        appBarWaveDecorPath,
        width: 279,
        height: 152,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
