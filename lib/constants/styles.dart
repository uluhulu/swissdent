import 'package:flutter/material.dart';
import 'package:swissdent/constants/colors.dart';

///base
final normalStyle = TextStyle(
  fontWeight: FontWeight.w400,
);

final boldStyle = TextStyle(
  fontWeight: FontWeight.w700,
);

final semiBoldStyle = TextStyle(
  fontWeight: FontWeight.w600,
);

///sizes
final normal15Style = normalStyle.copyWith(fontSize: 15);
final normal11Style = normalStyle.copyWith(fontSize: 11, color: registrationTimerColorBlack);
final normal11StyleRed = normalStyle.copyWith(fontSize: 11, color: registrationTimerColor);
final normal15StyleGrey = normalStyle.copyWith(fontSize: 15, color: registrationTermOfUseGreyColor);
final normal15StyleBlue = normalStyle.copyWith(fontSize: 15, color: registrationTermOfUseBlueColor);
final semiBold24Style = semiBoldStyle.copyWith(fontSize: 24);
final semiBold17Style = semiBoldStyle.copyWith(fontSize: 17, color: registrationDescriptionColor);
final semiBold17WhiteStyle = semiBoldStyle.copyWith(fontSize: 17, color: buttonTextColor);
