// @dart=2.9

enum FinancialTileType {
  Bonuses,
  Budget,
  Analysis,
}

class FinancialItem {
  String category = "";
  FinancialTileType type = FinancialTileType.Analysis;

  FinancialItem(this.category, this.type);
}
