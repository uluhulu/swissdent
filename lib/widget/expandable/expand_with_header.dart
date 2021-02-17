import 'dart:math';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/styles.dart';

///expandable card for service
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=169%3A279
class ExpandWithHeader extends StatefulWidget {
  /// collapse listener for card
  final VoidCallback onCollapseListener;

  /// card of service
  final String cardName;

  ///body of card
  final Widget expandableBody;

  /// header text style
  final TextStyle headerStyle;

  ///icon of header
  final Widget icon;

  ///show animation after expand
  final bool isShowAnimation;

  const ExpandWithHeader({
    Key key,
    this.onCollapseListener,
    this.cardName,
    this.expandableBody,
    this.headerStyle,
    this.icon,
    this.isShowAnimation = true,
  }) : super(key: key);

  @override
  _ExpandWithHeaderState createState() => _ExpandWithHeaderState();
}

class _ExpandWithHeaderState extends State<ExpandWithHeader>
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
          Expanded(
            flex: 3,
            child: Text(
              widget.cardName,
              style: widget.headerStyle ?? bold15StyleBlack,
            ),
          ),
          Spacer(),
          if (widget.isShowAnimation)
            RotationTransition(
              turns: _animation,
              child: _buildIcon(),
            ),
          if (!widget.isShowAnimation) _buildIcon(),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return widget.icon ??
        Image.asset(
          iconCartArrow,
          width: 12,
          height: 20,
        );
  }

  Widget _buildExpandBody() {
    return widget.expandableBody;
  }
}
