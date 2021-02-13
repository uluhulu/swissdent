import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/screens/main_menu_screen/widget/main_menu_app_bar.dart';
import 'package:swissdent/screens/main_menu_screen/widget/user_card/user_card.dart';
import 'package:swissdent/screens/main_menu_screen/widget/user_card/widget/user_card_with_cart.dart';
import 'package:swissdent/screens/main_menu_screen/widget/user_card/widget/user_card_without_cart.dart';
///main menu screen
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=3%3A2715
class MainMenuScreen extends StatefulWidget {
  @override
  _MainMenuScreenState createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainMenuBackgroundColor,
      body: _buildBody(),
    );
  }
  Widget _buildBody(){
    return Column(
      children: [
        MainMenuAppBar(),
        // UserCardWithoutCart(
        //   userName: 'black cock',
        //   userEmail: 'black@cock.suck',
        //   avatarPath: 'https://cdn009.mndcdn.net/photo/c/4/b/2fc1947a75b55b357cade348618085ab_view.jpg',
        // ),
        ListView(
          children: [
            UserCard(productCount: 3,),

          ],
        ),

      ],
    );
  }
}
