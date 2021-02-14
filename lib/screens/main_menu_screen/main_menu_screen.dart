import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/screens/main_menu_screen/widget/main_menu_app_bar.dart';
import 'package:swissdent/screens/main_menu_screen/widget/main_menu_card.dart';
import 'package:swissdent/screens/main_menu_screen/widget/user_card/user_card.dart';
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
      backgroundColor: mainMenuBackgroundColor,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    // return ListView(
    //   children: [
    //     UserCard(
    //       productCount: 3,
    //     ),
    //     MainMenuCard(iconPath: iconPerson,cardText: personalCabinet,),
    //     MainMenuCard(iconPath: iconServices,cardText: services,),
    //     MainMenuCard(iconPath: iconProducts,cardText: products,),
    //     MainMenuCard(iconPath: iconTeam,cardText: team,),
    //     MainMenuCard(iconPath: iconHelp,cardText: help,),
    //   ],
    // );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MainMenuAppBar(),
        // UserCardWithoutCart(
        //   userName: 'black cock',
        //   userEmail: 'black@cock.suck',
        //   avatarPath: 'https://cdn009.mndcdn.net/photo/c/4/b/2fc1947a75b55b357cade348618085ab_view.jpg',
        // ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserCard(
                productCount: 3,
                userName: 'User User',
                userEmail: 'user@mail.com',
                avatarPath: 'https://www.denofgeek.com/wp-content/uploads/2019/11/star-wars-the-mandalorian-baby-yoda.png?fit=1401%2C734',
              ),
              MainMenuCard(iconPath: iconPerson,cardText: personalCabinet,),
              MainMenuCard(iconPath: iconServices,cardText: services,),
              MainMenuCard(iconPath: iconProducts,cardText: products,),
              MainMenuCard(iconPath: iconTeam,cardText: team,),
              MainMenuCard(iconPath: iconHelp,cardText: help,),
              Padding(
                padding: const EdgeInsets.only(
                    top: 24.0,left: 16,right: 16,bottom: 37),
                child: SwissdentButton(
                  buttonColor: emergencyCallButtonColor,
                  buttonText: emergencyCallButton,
                  isAvaliable: true,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
