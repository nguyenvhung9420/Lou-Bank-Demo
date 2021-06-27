// @dart=2.9

// import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:loubank/models/currency.dart';

class CurrencyTile {
  Currency data;
  String imageName = "";

  CurrencyTile({@required this.data, @required this.imageName});

  String getIconLocation() {
    return ("assets/currencies/" +
        this.imageName.trim().toLowerCase() +
        ".png");
  }
}
