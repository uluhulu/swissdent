import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/data/user_info/interactor/user_info_interactor.dart';
import 'package:swissdent/di.dart';
import 'package:swissdent/screens/cart_screen/cart_screen.dart';
import 'package:swissdent/screens/help_screen/help_screen.dart';
import 'package:swissdent/screens/main_menu_screen/bloc/main_menu_screen_bloc.dart';
import 'package:swissdent/screens/main_menu_screen/bloc/main_menu_screen_event.dart';
import 'package:swissdent/screens/main_menu_screen/bloc/main_menu_screen_state.dart';
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
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return MainMenuScreenBloc(
          userInfoInteractor: getIt<UserInfoInteractor>(),
        );
      },
      child: BlocConsumer<MainMenuScreenBloc, MainMenuScreenState>(
        listener: (BuildContext context, state) {
          if (state is UserInfoNavigateState) _navigateToUserProfileScreen();
          if (state is CartNavigateState) _navigateToCartScreen();
          if (state is PersonalCabinetNavigateState)
            _navigateToPersonalCabinetScreen();
          if (state is ServicesNavigateState) _navigateToServicesScreen();
          if (state is ProductsNavigateState) _navigateToProductScreen();
          if (state is TeamNavigateState) _navigateToTeamScreen();
          if (state is HelpNavigateState) _navigateToHelpScreen();
          if (state is ChatNavigateState) _navigateToHelpScreen();
        },
        builder: (BuildContext context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MainMenuAppBar(),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _buildUserCard(context, state),
                    _buildMainMenuScreenCard(context, state),
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
        },
      ),
    );
  }

  Widget _buildUserCard(BuildContext context, state) {
    return UserCard(
      productCount: 3,
      userName: "${state.userName} ${state.userSurname}",
      userEmail: '${state.userEmail}',
      navigateToCartScreen: () {
        sendCartNavigateEvent(context);
      },
      navigateToUserProfileScreen: () {
        sendUserInfoNavigateEvent(context);
      },
      avatarPath:
          'https://www.denofgeek.com/wp-content/uploads/2019/11/star-wars-the-mandalorian-baby-yoda.png?fit=1401%2C734',
    );
  }

  Widget _buildMainMenuScreenCard(BuildContext context, state) {
    return Column(
      children: [
        MainMenuCard(
          iconPath: iconPerson,
          cardText: personalCabinet,
          onTap: () {
            sendPersonalCabinetNavigateEvent(context);
          },
        ),
        MainMenuCard(
            iconPath: iconServices,
            cardText: services,
            onTap: () {
              sendServicesNavigateEvent(context);
            }),
        MainMenuCard(
          iconPath: iconProducts,
          cardText: products,
          onTap: () {
            sendProductsNavigateEvent(context);
          },
        ),
        MainMenuCard(
          iconPath: iconTeam,
          cardText: team,
          onTap: () {
            sendTeamNavigateEvent(context);
          },
        ),
        MainMenuCard(
          iconPath: iconHelp,
          cardText: help,
          onTap: () {
            sendHelpNavigateEvent(context);
          },
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

  void sendUserInfoNavigateEvent(
    BuildContext context,
  ) {
    BlocProvider.of<MainMenuScreenBloc>(context).add(UserInfoNavigateEvent());
  }

  void sendCartNavigateEvent(
    BuildContext context,
  ) {
    BlocProvider.of<MainMenuScreenBloc>(context).add(CartNavigateEvent());
  }

  void sendPersonalCabinetNavigateEvent(
    BuildContext context,
  ) {
    BlocProvider.of<MainMenuScreenBloc>(context)
        .add(PersonalCabinetNavigateEvent());
  }

  void sendServicesNavigateEvent(
    BuildContext context,
  ) {
    BlocProvider.of<MainMenuScreenBloc>(context).add(ServicesNavigateEvent());
  }

  void sendProductsNavigateEvent(
    BuildContext context,
  ) {
    BlocProvider.of<MainMenuScreenBloc>(context).add(ProductsNavigateEvent());
  }

  void sendTeamNavigateEvent(
    BuildContext context,
  ) {
    BlocProvider.of<MainMenuScreenBloc>(context).add(TeamNavigateEvent());
  }
  void sendHelpNavigateEvent(
    BuildContext context,
  ) {
    BlocProvider.of<MainMenuScreenBloc>(context).add(HelpNavigateEvent());
  }
}
