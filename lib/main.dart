// @dart=2.9

import 'package:flutter/material.dart';
import 'package:loubank/views/entry/entry_view.dart';
import 'package:loubank/helpers/bottom_tab_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => BottomTabRepository()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LouBank',
      theme: ThemeData(
        dividerColor: Colors.transparent,
        primarySwatch: Colors.amber,
        brightness: Brightness.dark,
      ),
      home: EntryScreen(),
    );
  }
}
