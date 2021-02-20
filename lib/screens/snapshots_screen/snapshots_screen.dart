import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/screens/snapshots_screen/widget/snapshot_card.dart';
import 'package:swissdent/widget/appbar.dart';

///Snapsots screen ui
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=106%3A405
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
        onBackCallback: () => Navigator.of(context).pop(),
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
