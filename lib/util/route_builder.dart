import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Native route builder
Route buildRoute(Widget screen) {
  if (Platform.isIOS) {
    return CupertinoPageRoute(
      builder: (context) {
        return screen;
      },
    );
  }

  return MaterialPageRoute(
    builder: (context) {
      return screen;
    },
  );
}
