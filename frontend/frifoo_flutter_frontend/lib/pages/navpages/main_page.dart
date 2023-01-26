import 'dart:html';

import 'package:flutter/material.dart';
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
      body: pages[0],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        // elevation: 0,
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Favorites", icon: Icon(Icons.favorite)),
          BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: "Statistics", icon: Icon(Icons.bar_chart)),
          BottomNavigationBarItem(label: "Shopping List", icon: Icon(Icons.checklist)),
        ]
      ),
    );
  }
}