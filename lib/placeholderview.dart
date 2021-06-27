// @dart=2.9

import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loubank/formatter.dart';

class PlaceHolderPage extends StatefulWidget {
  PlaceHolderPage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  _PlaceHolderPageState createState() => _PlaceHolderPageState();
}

class _PlaceHolderPageState extends State<PlaceHolderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E1F1F),
      appBar: AppBar(
        leading: Container(
          height: 32,
          width: 32,
          child: Image.asset("assets/logo/avatar.png"),
        ),
        title: Image.asset("assets/logo/loubank_logo.png", width: 72),
        backgroundColor: Colors.transparent,
      ),
      body: Center(child: Text("Placeholder")),
    );
  }
}
