import 'package:flutter/material.dart';
import 'package:swissdent/di.dart';
import 'package:swissdent/screens/get_code_screen/get_code_screen.dart';
import 'package:swissdent/screens/log_in_screen/log_in_screen.dart';
import 'package:swissdent/screens/main_menu_screen/main_menu_screen.dart';
import 'package:swissdent/screens/registration_screen/registration_screen.dart';

void main() {
  initDi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus.unfocus();
        }
      },
      child: MaterialApp(
        title: 'Швейцарская стоматология',
        theme: ThemeData(
          fontFamily: 'Proxima Nova',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LogInScreen(),
        // home: LogInScreen(),
      ),
    );
  }
}
