import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/styles.dart';

///main menu card
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=3%3A2715
class MainMenuCard extends StatelessWidget {
  final String iconPath;
  final String cardText;
  final Function() onTap;

  const MainMenuCard({Key key, this.iconPath, this.cardText, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8,
      ),
      child: _buildCardBody(),
    );
  }

  Widget _buildCardBody() {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: 86.47,
        // width: 343,
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
            padding: const EdgeInsets.all(16.0), child: _buildCardInfo()),
      ),
    );
  }

  Widget _buildCardInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            width: 22,
            height: 22,
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            cardText,
            style: bold17BlackStyle,
          ),
        ],
      ),
    );
  }
}
