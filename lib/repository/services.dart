import 'package:loubank/models/card_data.dart';
import 'package:loubank/models/currency.dart';
import 'package:loubank/models/financial_item.dart';
import 'package:loubank/models/loan.dart';

class Services {
  static List<CardData> getCardDatum() {
    return [
      CardData(CardBrand.Visa, "Salary", 7000, "9006"),
      CardData(CardBrand.MasterCard, "Salary", 7000, "9006"),
      CardData(CardBrand.Visa, "Salary", 7000, "9006"),
      CardData(CardBrand.MasterCard, "Salary", 7000, "9006"),
      CardData(CardBrand.Visa, "Salary", 7000, "9006"),
      CardData(CardBrand.MasterCard, "Salary", 7000, "9006"),
    ];
  }

  static List<FinancialItem> getFinancialDatum() {
    List<FinancialItem> financialTiles = [
      FinancialItem("My bonuses", FinancialTileType.Bonuses),
      FinancialItem("My budget", FinancialTileType.Budget),
      FinancialItem("Financial analysis", FinancialTileType.Analysis),
      FinancialItem("My bonuses", FinancialTileType.Bonuses),
      FinancialItem("My budget", FinancialTileType.Budget),
      FinancialItem("Financial analysis", FinancialTileType.Analysis),
    ];
    return financialTiles;
  }

  static List<Loan> getLoansDatum() {
    return [
      Loan("90006", DateTime(2020, 6, 17), 56.90, 45.45),
      Loan("90006", DateTime(2020, 6, 17), 56.90, 45.45),
      Loan("90006", DateTime(2020, 6, 17), 56.90, 45.45),
      Loan("90006", DateTime(2020, 6, 17), 56.90, 45.45),
    ];
  }

  static List<Currency> getCurrencyDatum() {
    return [
      Currency("USD", 78.92, 89.10),
      Currency("EUR", 78.92, 89.10),
    ];
  }

  static List<Currency> getMetals() {
    return [
      Currency("Gold", 78.92, 89.10),
      Currency("Silver", 78.92, 89.10),
    ];
  }
}
