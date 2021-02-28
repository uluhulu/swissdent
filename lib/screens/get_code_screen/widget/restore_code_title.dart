import 'package:flutter/cupertino.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
///restore sms code
class RestoreCodeTitle extends StatelessWidget {
  final Function() onTap;

  const RestoreCodeTitle({Key key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onTap(),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          restoreCodeTitle,
          style: normal15StyleBlue,
        ),
      ),
    );
  }
}
