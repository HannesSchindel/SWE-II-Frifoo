import 'dart:html';

import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/constants.dart';
import 'package:frifoo_flutter_frontend/pages/navpages/favorites_page.dart';
import 'package:frifoo_flutter_frontend/pages/navpages/home_page.dart';
import 'package:frifoo_flutter_frontend/pages/navpages/search_page.dart';
import 'package:frifoo_flutter_frontend/pages/navpages/shoppinglist_page.dart';
import 'package:frifoo_flutter_frontend/pages/navpages/statistics_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    FavoritesPage(),
    SearchPage(),
    StatisticsPage(),
    ShoppingListPage(),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: DARK_GREEN,
        unselectedItemColor: Colors.grey.withOpacity(0.8),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        // elevation: 0,
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home_rounded)),
          BottomNavigationBarItem(label: "Favorites", icon: Icon(Icons.favorite_rounded)),
          BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search_rounded)),
          BottomNavigationBarItem(label: "Statistics", icon: Icon(Icons.bar_chart_rounded)),
          BottomNavigationBarItem(label: "Shopping List", icon: Icon(Icons.checklist_rounded)),
        ]
      ),
    );
  }
}