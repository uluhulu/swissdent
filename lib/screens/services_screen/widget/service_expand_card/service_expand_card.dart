import 'dart:math';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/styles.dart';

///expandable card for service
///todo figma link
class ServiceExpandCard extends StatefulWidget {
  /// collapse listener for card
  final VoidCallback onCollapseListener;

  /// card of service
  final String cardName;

  ///body of card
  final Widget expandableBody;

  const ServiceExpandCard({
    Key key,
    this.onCollapseListener,
    this.cardName,
    this.expandableBody,
  }) : super(key: key);

  @override
  _ServiceExpandCardState createState() => _ServiceExpandCardState();
}

class _ServiceExpandCardState extends State<ServiceExpandCard>
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
        widget.onCollapseListener();
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
    return _buildExpandCard();
  }

  Widget _buildExpandCard() {
    return ExpandableNotifier(
      child: ScrollOnExpand(
        scrollOnExpand: true,
        scrollOnCollapse: true,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 7),
                  blurRadius: 15,
                  color: shadowBlackColor.withOpacity(0.1),
                ),
                BoxShadow(
                  offset: Offset(4, 4),
                  blurRadius: 4,
                  color: shadowWhiteColor.withOpacity(0.25),
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
            ),
            child: _buildExpandPanel(),
          ),
        ),
      ),
    );
  }

  Widget _buildExpandPanel() {
    return ExpandablePanel(
      controller: _expandableController,
      theme: ExpandableThemeData(
        headerAlignment: ExpandablePanelHeaderAlignment.center,
        tapBodyToCollapse: true,
        iconColor: Colors.black.withOpacity(0.4),
        scrollAnimationDuration: Duration(milliseconds: 200),
        hasIcon: false,
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
