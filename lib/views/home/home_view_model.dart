// @dart=2.9
import 'package:loubank/models/card_data.dart';
import 'package:loubank/models/currency.dart';
import 'package:loubank/models/financial_item.dart';
import 'package:loubank/models/loan.dart';
import 'package:loubank/repository/services.dart';

class HomeViewModel {
  List<CardData> cardsData = Services.getCardDatum();

  List<FinancialItem> financialTiles = Services.getFinancialDatum();

  List<Loan> loans = Services.getLoansDatum();

  List<Currency> currencies = Services.getCurrencyDatum();

  List<Currency> metals = Services.getMetals();
}
