import 'package:flutter/material.dart';
import 'package:movies/myTheme.dart';
import 'package:movies/tabs/browse_tab.dart';
import 'package:movies/tabs/home_tab.dart';
import 'package:movies/tabs/search_tab.dart';
import 'package:movies/tabs/watchlist_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime movieTime = DateTime.now();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.black,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: MyTheme.lighterGreyColor,
        fixedColor: MyTheme.selectedYellowColor,
        backgroundColor: MyTheme.greyColor,
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'SEARCH'),
          BottomNavigationBarItem(
              icon: Icon(Icons.movie_creation), label: 'BROWSE'),
          BottomNavigationBarItem(
              icon: Icon(Icons.collections_bookmark_sharp), label: 'WATCHLIST')
        ],
      ),
      body: tabs[selectedIndex],
    );
  }

  List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    WatchListTab(),
  ];
}
