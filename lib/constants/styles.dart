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

final normal10Style = normalStyle.copyWith(
  fontSize: 10,
);

final normal11Style = normalStyle.copyWith(
  fontSize: 11,
);

final normal11StyleRed = normalStyle.copyWith(
  fontSize: 11,
  color: palete['alarm'],
);
final normal12StyleGrey = normalStyle.copyWith(
  fontSize: 11,
  color: palete['gray1'],
);

final bold14Style = boldStyle.copyWith(fontSize: 14);

final normal15Style = normalStyle.copyWith(fontSize: 15);
final bold15StyleBlack = boldStyle.copyWith(fontSize: 15,color: palete['black']);

final normal15StyleGrey = normal15Style.copyWith(
  color: palete['gray2'],
);
final normal15StyleGrey5 = normal15Style.copyWith(
  color: palete['gray5'],
);
final normal15StyleBlue = normal15Style.copyWith(
  color: palete['dark'],
);
final normal16StyleBlue = normalStyle.copyWith(
  fontSize: 16,
  color: palete['dark'],
);

final normal16StyleRed = normalStyle.copyWith(
  fontSize: 16,
  color: palete['alarm'],
);

final normal16StyleBlack = normalStyle.copyWith(
  fontSize: 16,
  color: palete['black'],
);

final normal16StyleBlack600 = normal16StyleBlack.copyWith(
  fontWeight: FontWeight.w600,
);

final bold17BlackStyle = boldStyle.copyWith(
  fontSize: 17,
  color: palete['black'],
);

final semiBold17Style = semiBoldStyle.copyWith(
  fontSize: 17,
);
final semiBold17BlackStyle = semiBoldStyle.copyWith(
  fontSize: 17,
  color: palete['black'],
);
final semiBold17WhiteStyle = semiBoldStyle.copyWith(
  fontSize: 17,
  color: palete['white'],
);
final bold18BlackStyle = boldStyle.copyWith(
  fontSize: 18,
  color: palete['dark'],
);
final bold18BlackGrey = boldStyle.copyWith(
  fontSize: 18,
  color: palete['gray3'],
);

final bold20BlackStyle = boldStyle.copyWith(
  fontSize: 20,
  color: palete['black'],
);

final semiBold24Style = semiBoldStyle.copyWith(fontSize: 24);

final semiBold24WhiteStyle = semiBoldStyle.copyWith(
  fontSize: 24,
  color: palete['white'],
);
final bold24BlackStyle =
    boldStyle.copyWith(fontSize: 24, color: mainMenuNameColorBlack);
