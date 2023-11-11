import 'package:flutter/material.dart';
import 'package:movies/myTheme.dart';
import 'package:movies/tabs/CategoriesTap.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyTheme.black,
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: MyTheme.greyColor,
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            selectedItemColor: MyTheme.selectedYellowColor,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'SEARCH'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.movie_creation), label: 'BROWSE'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.collections_bookmark_sharp),
                  label: 'WATCHLIST')
            ],
          ),
        ),
        body: tabs[selectedIndex],
      ),
    );
  }

  List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    CategoriesTap(),
    WatchListTab(),
  ];
}
