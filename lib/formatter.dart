// @dart=2.9

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyFormatter {
  String _locale = 'en_US';
  static MyFormatter current = MyFormatter();

  String formatNumber(String s, {bool twoDecimals = false}) => NumberFormat(
          twoDecimals ? "###,###,###,##0.0#" : "###,###,###,##0.0#####",
          _locale)
      .format(double.parse(s));
  String get currency =>
      NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;

  String formatDateFromTimestamp(int timeStampAsMilliseconds,
      {String formatPattern = 'yyyy-MM-dd'}) {
    final f = new DateFormat(formatPattern);
    return f.format(
        new DateTime.fromMillisecondsSinceEpoch(timeStampAsMilliseconds));
  }

  String formatToday({String formatPattern = 'yyyy-MM-dd'}) {
    final f = new DateFormat(formatPattern);
    return f.format(new DateTime.fromMillisecondsSinceEpoch(
        DateTime.now().millisecondsSinceEpoch * 1000));
  }
}
