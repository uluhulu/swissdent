import 'dart:math';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/styles.dart';

///Expand without header
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=11%3A2993
class ExpandWithoutHeader extends StatefulWidget {
  ///name of treatment
  final String cardName;

  ///body of expand card
  final Widget expandableBody;

  const ExpandWithoutHeader({
    Key key,
    this.cardName,
    this.expandableBody,
  }) : super(key: key);

  @override
  _ExpandWithoutHeaderState createState() => _ExpandWithoutHeaderState();
}

class _ExpandWithoutHeaderState extends State<ExpandWithoutHeader>
    with TickerProviderStateMixin {
  ExpandableController _expandableController;
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    _initExpandController();
    _initRotateAnimation();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _expandableController.dispose();
    _animationController.dispose();
  }

  void _initExpandController() {
    _expandableController = ExpandableController();
    _expandableController.addListener(() {
      if (_expandableController.expanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  void _initRotateAnimation() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation =
        Tween<double>(begin: 0, end: pi / 12.5).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      controller: _expandableController,
      child: ScrollOnExpand(
        scrollOnExpand: true,
        scrollOnCollapse: true,
        child: ExpandablePanel(
          theme: ExpandableThemeData(
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            tapBodyToCollapse: true,
            iconColor: Colors.black.withOpacity(0.4),
            scrollAnimationDuration: Duration(milliseconds: 200),
            hasIcon: false,
            useInkWell: false,
          ),
          builder: (_, collapsed, expanded) {
            return Expandable(
              collapsed: collapsed,
              expanded: expanded,
              theme: const ExpandableThemeData(crossFadePoint: 0),
            );
          },
          header: _buildCardHeader(),
          expanded: _buildExpandBody(),
        ),
      ),
    );
  }

  Widget _buildCardHeader() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 232,
            child: Text(
              widget.cardName,
              style: bold20BlackStyle,
            ),
          ),
          Spacer(),
          RotationTransition(
            turns: _animation,
            child: Image.asset(
              iconCartArrow,
              width: 12,
              height: 20,
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget _buildExpandBody() {
    return widget.expandableBody;
  }
}
