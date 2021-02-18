import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/widget/swissdent_textfield/swissdent_default_textfield.dart';
import 'package:swissdent/widget/swissdent_textfield/swissdent_search_textfield.dart';

///Appbar with search panel
///todo figma link
class SearchAppbar extends StatefulWidget {
  @override
  _SearchAppbarState createState() => _SearchAppbarState();
}

class _SearchAppbarState extends State<SearchAppbar> {
  ExpandableController _expandableController;
  FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    _initExpandController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _expandableController.dispose();
    searchFocusNode.dispose();
  }

  void _initExpandController() {
    _expandableController = ExpandableController();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: ScrollOnExpand(
        scrollOnExpand: true,
        scrollOnCollapse: true,
        child: Container(
          color: appbarColor,
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
        tapBodyToCollapse: false,
        tapHeaderToExpand: false,
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
      header: _buildAppbarHeader(),
      expanded: _buildExpandBody(),
    );
  }

  Widget _buildAppbarHeader() {
    return Row(
      children: [
        CupertinoButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: backLeadingButtonColor,
          ),
        ),
        Spacer(),
        Text(
          products,
          style: bold17BlackStyle,
        ),
        Spacer(),
        CupertinoButton(
          onPressed: () {
            handleSearchbarVisibility();
          },
          child: Icon(
            Icons.search,
            color: backLeadingButtonColor,
          ),
        ),
      ],
    );
  }

  Widget _buildExpandBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SwissdentSearchTextField(
        onType: (text) {},
        hint: searchBarHint,
        onSubmitted: (text) {},
        focusNode: searchFocusNode,
      ),
    );
  }

  void handleSearchbarVisibility() {
    if (_expandableController.expanded) {
      setState(() {
        _expandableController.expanded = false;
        searchFocusNode.unfocus();
      });
    } else {
      setState(() {
        _expandableController.expanded = true;
        searchFocusNode.requestFocus();
      });
    }
  }
}
