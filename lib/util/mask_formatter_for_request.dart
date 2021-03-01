import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:swissdent/constants/strings.dart';

final maskFormatterForRequest = new MaskTextInputFormatter(
  mask: '$numPrefix(###)###-##-##',
  filter: {
    "#": RegExp(r'[0-9]'),
  },
);