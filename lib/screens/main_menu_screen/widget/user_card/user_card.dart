import 'package:flutter/material.dart';
import 'package:swissdent/screens/main_menu_screen/widget/user_card/widget/user_card_with_cart.dart';
import 'package:swissdent/screens/main_menu_screen/widget/user_card/widget/user_card_without_cart.dart';
import 'package:swissdent/screens/main_menu_screen/widget/user_card/widget/user_info/user_info.dart';

///main screen user card
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=3%3A2715
class UserCard extends StatelessWidget {
  final int productCount;
  final String userName;
  final String userEmail;
  final String avatarPath;
  final Function() navigateToCartScreen;
  final Function() navigateToUserProfileScreen;



  const UserCard({Key key, this.productCount, this.userName, this.userEmail, this.avatarPath, this.navigateToCartScreen, this.navigateToUserProfileScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  productCount != null
          ? UserCardWithCart(productCount: productCount, userName: userName, userEmail: userEmail,avatarPath: avatarPath, navigateToCartScreen: navigateToCartScreen,navigateToUserProfileScreen: navigateToUserProfileScreen,)
          : UserCardWithoutCart(userName: userName, userEmail: userEmail,avatarPath: avatarPath,navigateToUserProfileScreen: navigateToUserProfileScreen);

  }
}
