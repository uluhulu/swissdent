import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Native route builder
Route<T> buildRoute<T>(Widget screen) {
  if (Platform.isIOS) {
    return CupertinoPageRoute<T>(
      builder: (context) {
        return screen;
      },
    );
  }

  return MaterialPageRoute<T>(
    builder: (context) {
      return screen;
    },
  );
}
