// @dart=2.9

// import 'dart:ffi';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loubank/models/card_data.dart';

class CardDataTile {
  CardData data;

  CardDataTile({@required this.data});

  List<Color> getColorGradient() {
    List<List<Color>> _colorLists = [
      [Color(0xffEAEAEA), Color(0xffB2D0CE)],
      [Color(0xffFCFFDF), Color(0xffF1FE87)],
      [Color(0xffF2EFF4), Color(0xffB8A9C6)],
    ];
    final _random = new Random();
    List<Color> element = _colorLists[_random.nextInt(_colorLists.length)];
    return element;
  }

  String getBrandImageLocation() {
    switch (this.data.brand) {
      case CardBrand.Visa:
        return "assets/logo/visa.png";
        break;
      case CardBrand.MasterCard:
        return "assets/logo/mastercard.png";
        break;
      default:
        return "assets/logo/visa.png";
        break;
    }
  }

  String getAmountAsString(NumberFormat formatter) {
    return this.data.getAmountAsString(formatter);
  }
}
