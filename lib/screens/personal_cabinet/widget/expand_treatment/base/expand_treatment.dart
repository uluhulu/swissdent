import 'dart:math';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/styles.dart';

///Expand treatment cart
///todo figma link
class ExpandTreatment extends StatefulWidget {
  ///name of treatment
  final String cardName;

  ///body of expand card
  final Widget expandableBody;

  const ExpandTreatment({
    Key key,
    this.cardName,
    this.expandableBody,
  }) : super(key: key);

  @override
  _ExpandTreatmentState createState() => _ExpandTreatmentState();
}

class _ExpandTreatmentState extends State<ExpandTreatment>
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
      child: ScrollOnExpand(
        scrollOnExpand: true,
        scrollOnCollapse: false,
        child: ExpandablePanel(
          controller: _expandableController,
          theme: ExpandableThemeData(
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            tapBodyToCollapse: true,
            iconColor: Colors.black.withOpacity(0.4),
            hasIcon: false,
          ),
          builder: (_, collapsed, expanded) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Expandable(
                collapsed: collapsed,
                expanded: expanded,
                theme: const ExpandableThemeData(crossFadePoint: 0),
              ),
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
          Text(
            widget.cardName,
            style: bold20BlackStyle,
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
