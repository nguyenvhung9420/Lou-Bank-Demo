// @dart=2.9
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:loubank/models/financial_item.dart';

class FinancialTile {
  FinancialItem data;

  FinancialTile({@required this.data});

  Container getImageForType() {
    switch (this.data.type) {
      case FinancialTileType.Analysis:
        return Container(
          width: 32,
          height: 32,
          decoration: new BoxDecoration(
            color: Color(0xffAA9EB7),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Image.asset(
            "assets/logo/analysis.png",
            width: 13.3,
            height: 13.3,
          ),
        );
        break;

      case FinancialTileType.Budget:
        return Container(
          width: 32,
          height: 32,
          decoration: new BoxDecoration(
            color: Color(0xffB2D0CE),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Image.asset(
            "assets/logo/analysis.png",
            width: 13.3,
            height: 13.3,
          ),
        );
        break;

      case FinancialTileType.Bonuses:
        return Container(
          width: 32,
          height: 32,
          decoration: new BoxDecoration(
            color: Color(0xffF2FE8D),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Image.asset(
            "assets/logo/analysis.png",
            width: 13.3,
            height: 13.3,
          ),
        );
        break;

      default:
        return Container(
          width: 32,
          height: 32,
          decoration: new BoxDecoration(
            color: Color(0xffF2FE8D),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Image.asset("assets/logo/analysis.png",
              width: 13.3, height: 13.3),
        );
        break;
    }
  }
}
