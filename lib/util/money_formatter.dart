import 'package:flutter_money_formatter/flutter_money_formatter.dart';

///format money
String formatMoney(double amount) {
  FlutterMoneyFormatter _moneyFormatter = new FlutterMoneyFormatter(
    amount: amount,
    settings: MoneyFormatterSettings(
      thousandSeparator: ' ',
      decimalSeparator: ',',
      symbolAndNumberSeparator: ' ',
      compactFormatType: CompactFormatType.short,
    ),
  );

  return _moneyFormatter.output.nonSymbol;
}
