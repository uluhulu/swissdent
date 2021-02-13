import 'package:flutter/material.dart';
import 'package:swissdent/screens/main_menu_screen/widget/user_card/widget/user_card_with_cart.dart';
import 'package:swissdent/screens/main_menu_screen/widget/user_card/widget/user_card_without_cart.dart';
import 'package:swissdent/screens/main_menu_screen/widget/user_card/widget/user_info/user_info.dart';

///main screen user card
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=3%3A2715
class UserCard extends StatelessWidget {
  final int productCount;

  const UserCard({Key key, this.productCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  productCount != null
          ? UserCardWithCart(productCount: productCount, userName: "Волосатая попка", userEmail: "hair@jopa.com",avatarPath: 'https://www.meme-arsenal.com/memes/094abbac8e61828728f2401d26b2c792.jpg',)
          : UserCardWithoutCart(userName: "Волосатая попка", userEmail: "hair@jopa.com",avatarPath: 'https://www.meme-arsenal.com/memes/094abbac8e61828728f2401d26b2c792.jpg',);

  }
}
