// @dart=2.9
import 'package:intl/intl.dart';

class Loan {
  String accountNum = "";
  DateTime expiryDate = DateTime.now();
  double amount = 0.0;
  double rate = 0.0;

  Loan(this.accountNum, this.expiryDate, this.amount, this.rate);

  String getExpiryDateAsString({String formatPattern = "dd/MM/yyyy"}) {
    final f = new DateFormat(formatPattern);
    return f.format(this.expiryDate);
  }

  String getAmountAsString(NumberFormat formatter) {
    return formatter.format(this.amount);
  }
}
