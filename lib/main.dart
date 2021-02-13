import 'package:flutter/material.dart';
import 'package:swissdent/screens/cart_screen/cart_screen.dart';
import 'package:swissdent/screens/main_menu_screen/main_menu_screen.dart';
import 'package:swissdent/screens/main_menu_screen/widget/user_card/user_card.dart';
import 'package:swissdent/screens/main_menu_screen/widget/user_card/widget/user_info/circle_avatar.dart';
import 'package:swissdent/screens/personal_cabinet/personal_cabinet_screen.dart';

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
        // home: CartScreen(),
        home: CartScreen(),
      ),
    );
  }
}
