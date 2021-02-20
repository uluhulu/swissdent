import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/styles.dart';

///card for snapsot
///todo figma link
class SnapshotCard extends StatelessWidget {
  ///image url of snapshot
  final String snapshotPath;

  ///title of snapshot card
  final String snapshotTitle;

  ///date of snapshot
  final DateTime snapshotDate;

  const SnapshotCard({
    Key key,
    this.snapshotPath,
    this.snapshotTitle,
    this.snapshotDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: snapshotCardColor,
          borderRadius: BorderRadius.all(Radius.circular(14)),
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
        ),
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSnapshot(),
          SizedBox(height: 16),
          _buildCardTitle(),
          // SizedBox(height: 16),
          _buildCardBottomRow(),
        ],
      ),
    );
  }

  Widget _buildSnapshot() {
    return Container(
      // width: 312,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        image: DecorationImage(
          image: NetworkImage(snapshotPath),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  Widget _buildCardTitle() {
    return Text(
      snapshotTitle,
      style: bold20BlackStyle,
    );
  }

  Widget _buildCardBottomRow() {
    return Row(
      children: [
        _buildDate(),
        Spacer(),
        _buildShareButton(),
      ],
    );
  }

  Widget _buildDate() {
    return Text(
      '${snapshotDate.day}.${snapshotDate.month}.${snapshotDate.year}',
      style: normal17BlueStyle,
    );
  }

  Widget _buildShareButton() {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Image.asset(
        iconDocument,
        width: 22,
      ),
      onPressed: () {},
    );
  }
}
