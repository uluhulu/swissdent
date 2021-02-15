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
        _buildPhoto(),
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

  Widget _buildPhoto() {
    return Container(
      width: width,
      height: 375,
      child: Image.network(
        photoPath,
      ),
    );
  }
}
