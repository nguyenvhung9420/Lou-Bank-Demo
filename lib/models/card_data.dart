// @dart=2.9
import 'package:intl/intl.dart';

class CardData {
  CardBrand brand = CardBrand.Visa;
  String category = "";
  double amount = 0.0;
  String last4Digits = "";

  CardData(this.brand, this.category, this.amount, this.last4Digits);

  String getAmountAsString(NumberFormat formatter) {
    return formatter.format(this.amount);
  }
}

enum CardBrand {
  Visa,
  MasterCard,
}
