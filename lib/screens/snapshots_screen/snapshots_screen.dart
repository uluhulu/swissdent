import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/screens/snapshots_screen/widget/snapshot_card.dart';
import 'package:swissdent/widget/appbar.dart';

///Snapsots screen ui
///todo figma link
class SnapshotsScreen extends StatefulWidget {
  @override
  _SnapshotsScreenState createState() => _SnapshotsScreenState();
}

class _SnapshotsScreenState extends State<SnapshotsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(
        titleText: snapshotsScreenTitle,
        onBackCallback: () {},
      ),
      backgroundColor: backgroundColor,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView(
      children: [
        SnapshotCard(
          snapshotPath: 'https://medicor.ru/images/rentgen-zubov-medicor-1.jpg',
          snapshotTitle: "Первый прием",
          snapshotDate: DateTime.now(),
        ),
        SnapshotCard(
          snapshotPath: 'https://medicor.ru/images/rentgen-zubov-medicor-1.jpg',
          snapshotTitle: "Второй прием",
          snapshotDate: DateTime.now(),
        ),
      ],
    );
  }
}
