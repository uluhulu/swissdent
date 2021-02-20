import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';

class ProductPhoto extends StatelessWidget {
  final String photoPath;
  final double width;
  final VoidCallback onBackCallback;

  const ProductPhoto({
    Key key,
    this.photoPath,
    this.width,
    this.onBackCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildPhoto(context),
        Positioned(
          left: 0,
            top: 30,
            child: CupertinoButton(
              onPressed: onBackCallback,
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: backLeadingButtonColor,
              ),
            ),)
      ],
    );
  }

  Widget _buildPhoto(BuildContext context) {
    return Container(
      width: width,
      height: MediaQuery.of(context).size.height / 2,
      child: Image.network(
        photoPath,
      ),
    );
  }
}
