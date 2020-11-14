import 'package:intl/intl.dart';

class FormatNumberToMoney {
  static String parseNumber(var value) {
    final numberFormat =
        NumberFormat.currency(locale: "pt_BR", name: "R\$", decimalDigits: 2);
    return numberFormat.format(value);
  }
}
