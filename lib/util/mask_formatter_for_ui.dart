import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:swissdent/constants/strings.dart';

final maskFormatterForUi = new MaskTextInputFormatter(
  mask: '$numPrefix ### ### ## ##',
  filter: {
    "#": RegExp(r'[0-9]'),
  },
);