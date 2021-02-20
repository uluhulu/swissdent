import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/screens/main_menu_screen/widget/user_card/widget/cart_info/cart_info.dart';
import 'package:swissdent/screens/main_menu_screen/widget/user_card/widget/user_info/user_info.dart';

///usercard with cart
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=3%3A5386
class UserCardWithCart extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String avatarPath;
  final int productCount;
  final Function() navigateToCartScreen;
  final Function() navigateToUserProfileScreen;

  const UserCardWithCart({
    Key key,
    this.userName,
    this.userEmail,
    this.avatarPath,
    this.productCount,
    this.navigateToCartScreen,
    this.navigateToUserProfileScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            color: userCardColor,
            borderRadius: BorderRadius.all(
              Radius.circular(14),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 7),
                blurRadius: 15,
                color: userCardShadowColor.withOpacity(0.01),
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => navigateToUserProfileScreen(),
                child: UserInfo(
                  userName: userName,
                  userEmail: userEmail,
                  avatarPath: avatarPath,
                ),
              ),
              GestureDetector(
                onTap: () => navigateToCartScreen(),
                  child: CartInfo(productCount: productCount,)),
            ],
          ),
        ),
      ),
    );
  }
}
