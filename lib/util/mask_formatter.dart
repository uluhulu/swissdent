import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:swissdent/constants/strings.dart';


final _uiNumFormatter = MaskTextInputFormatter(
  mask: '$numPrefix ### ### ## ##',
  filter: {
    "#": RegExp(r'[0-9]'),
  },
);

final _requestNumFormatter = MaskTextInputFormatter(
  mask: '$numPrefix(###)###-##-##',
  filter: {
    "#": RegExp(r'[0-9]'),
  },
);

