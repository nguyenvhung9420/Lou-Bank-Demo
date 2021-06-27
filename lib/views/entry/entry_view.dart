//@dart=2.9
import 'dart:ui';
import 'package:loubank/views/home/home_view.dart';
import 'package:loubank/placeholderview.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loubank/helpers/bottom_tab_provider.dart';

class EntryScreen extends StatefulWidget {
  EntryScreen({Key key}) : super(key: key);

  @override
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  onTapped(int index) {
    setState(() {
      context.read<BottomTabRepository>().changeTabIndex(index);
    });
  }

  List<BottomNavBarItem> tabs = [
    BottomNavBarItem(
        destination: MyHomePage(),
        iconImageLocation: "assets/navigation_bar_icons/home.png",
        title: "Home"),
    BottomNavBarItem(
        destination: PlaceHolderPage(),
        iconImageLocation: "assets/navigation_bar_icons/shop.png",
        title: "Shop"),
    BottomNavBarItem(
        destination: PlaceHolderPage(),
        iconImageLocation: "assets/navigation_bar_icons/card.png",
        title: "Cards"),
    BottomNavBarItem(
        destination: PlaceHolderPage(),
        iconImageLocation: "assets/navigation_bar_icons/chat.png",
        title: "Chats"),
    BottomNavBarItem(
        destination: PlaceHolderPage(),
        iconImageLocation: "assets/navigation_bar_icons/history.png",
        title: "History"),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int currentTabIndex = context.watch<BottomTabRepository>().tabIndex;
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: IndexedStack(
        index: currentTabIndex,
        children: tabs.map((e) => e.destination).toList(),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: BottomNavigationBar(
            backgroundColor: Color(0xff1E1E1E).withOpacity(0.8),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).accentColor,
            unselectedItemColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: currentTabIndex,
            onTap: onTapped,
            iconSize: 17,
            items: tabs
                .map((e) => BottomNavigationBarItem(
                      icon: e.getInactiveIcon(),
                      activeIcon: e.getActiveIcon(),
                      label: e.title,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

Route createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class BottomNavBarItem {
  Widget destination;
  String iconImageLocation;
  String title;

  BottomNavBarItem({
    @required this.destination,
    @required this.iconImageLocation,
    @required this.title,
  });

  Container getInactiveIcon() {
    return Container(
        width: 17,
        height: 17,
        child: Image.asset(iconImageLocation, color: Colors.white));
  }

  Container getActiveIcon() {
    return Container(
        width: 17,
        height: 17,
        child: Image.asset(iconImageLocation, color: Color(0xffF2FE8D)));
  }
}
