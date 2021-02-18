import 'package:flutter/material.dart';
import 'package:swissdent/screens/chat_screen/chat_screen.dart';
import 'package:swissdent/screens/cart_screen/cart_screen.dart';
import 'package:swissdent/screens/get_code_screen/get_code_screen.dart';
import 'package:swissdent/screens/help_screen/help_screen.dart';
import 'package:swissdent/screens/main_menu_screen/main_menu_screen.dart';
import 'package:swissdent/screens/product_details_scren/product_details_screen.dart';
import 'package:swissdent/screens/product_screen/product_screen.dart';
import 'package:swissdent/screens/registration_screen/registration_screen.dart';
import 'package:swissdent/screens/services_screen/services_screen.dart';
import 'package:swissdent/screens/splash_screen/splash_screen_first_open/splash_screen.dart';
import 'package:swissdent/screens/team_screen/team_screen.dart';
import 'package:swissdent/screens/user_profile_screen/user_profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Proxima Nova',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MainMenuScreen(),
      ),
    );
  }
}