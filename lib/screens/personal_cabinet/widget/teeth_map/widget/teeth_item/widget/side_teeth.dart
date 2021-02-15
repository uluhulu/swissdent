import 'package:flutter/cupertino.dart';

///Side teeth of [TeethItem]
///todo link figma
class SideTeeth extends StatelessWidget {
  /// Image of teeth
  final String teethImage;

  const SideTeeth({
    Key key,
    this.teethImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: _buildTeeth(),
    );
  }

  Widget _buildTeeth() {
    return Stack(
      children: [
        _buildTeethImage(),
      ],
    );
  }

  Widget _buildTeethImage() {
    return Positioned(
      bottom: 0,
      child: Image.asset(
        teethImage,
      ),
    );
  }
}
