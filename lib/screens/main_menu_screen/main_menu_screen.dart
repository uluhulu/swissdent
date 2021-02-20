import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/screens/cart_screen/cart_screen.dart';
import 'package:swissdent/screens/chat_screen/chat_screen.dart';
import 'package:swissdent/screens/help_screen/help_screen.dart';
import 'package:swissdent/screens/main_menu_screen/widget/main_menu_app_bar.dart';
import 'package:swissdent/screens/main_menu_screen/widget/main_menu_card.dart';
import 'package:swissdent/screens/main_menu_screen/widget/user_card/user_card.dart';
import 'package:swissdent/screens/personal_cabinet/personal_cabinet_screen.dart';
import 'package:swissdent/screens/product_screen/product_screen.dart';
import 'package:swissdent/screens/services_screen/services_screen.dart';
import 'package:swissdent/screens/team_screen/team_screen.dart';
import 'package:swissdent/screens/user_profile_screen/user_profile_screen.dart';
import 'package:swissdent/util/route_builder.dart';
import 'package:swissdent/widget/swissdent_button.dart';

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
      backgroundColor: backgroundColor,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MainMenuAppBar(),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserCard(
                productCount: 3,
                userName: 'User User',
                userEmail: 'user@mail.com',
                navigateToCartScreen: (){
                  _navigateToCartScreen();
                },
                navigateToUserProfileScreen: (){
                  _navigateToUserProfileScreen();
                },
                avatarPath:
                'https://www.denofgeek.com/wp-content/uploads/2019/11/star-wars-the-mandalorian-baby-yoda.png?fit=1401%2C734',
              ),
              MainMenuCard(
                iconPath: iconPerson,
                cardText: personalCabinet,
                onTap: () {
                  _navigateToPersonalCabinetScreen();
                },
              ),
              MainMenuCard(
                  iconPath: iconServices,
                  cardText: services,
                  onTap: () {
                    _navigateToServicesScreen();
                  }
              ),
              MainMenuCard(
                iconPath: iconProducts,
                cardText: products,
                onTap: (){
                  _navigateToProductScreen();
                },
              ),
              MainMenuCard(
                iconPath: iconTeam,
                cardText: team,
                onTap: (){
                  _navigateToTeamScreen();
                },
              ),
              MainMenuCard(
                iconPath: iconHelp,
                cardText: help,
                onTap: (){
                  _navigateToHelpScreen();
                },
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 24.0, left: 16, right: 16, bottom: 37),
                child: SwissdentButton(
                  buttonColor: emergencyCallButtonColor,
                  buttonText: Text(
                    emergencyCallButton,
                    style: semiBold17WhiteStyle,
                  ),
                  isAvaliable: true,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  void _navigateToPersonalCabinetScreen() {
    Navigator.of(context).push(buildRoute(PersonalCabinetScreen()));
  }

  void _navigateToServicesScreen() {
    Navigator.of(context).push(buildRoute(ServicesScreen()));
  }
  void _navigateToProductScreen() {
    Navigator.of(context).push(buildRoute(ProductScreen()));
  }
  void _navigateToTeamScreen() {
    Navigator.of(context).push(buildRoute(TeamScreen()));
  }
  void _navigateToHelpScreen() {
    Navigator.of(context).push(buildRoute(HelpScreen()));
  }
  void _navigateToCartScreen() {
    Navigator.of(context).push(buildRoute(CartScreen()));
  }
  void _navigateToUserProfileScreen() {
    Navigator.of(context).push(buildRoute(UserProfileScreen()));
  }
}
