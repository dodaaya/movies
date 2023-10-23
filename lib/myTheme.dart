import 'package:flutter/material.dart';

class MyTheme {
  static Color black = Color(0xff121312);
  static Color white = Color(0xffffffff);
  static Color greyColor = Color(0xff282A28);
  static Color greyBorderColor = Color(0xff707070);
  static Color primaryColor = Color(0xffF7B539);
  static Color selectedYellowColor = Color(0xffFFBB3B);
  static Color lighterGreyColor = Color(0xffB5B4B4);
  static Color bottomBarColor = Color(0xff1A1A1A);
  static Color transparentColor = Color(0xff514F4F);

  static ThemeData lightTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: greyColor,
        selectedItemColor: selectedYellowColor,
        selectedIconTheme: IconThemeData(color: selectedYellowColor),
        showSelectedLabels: true,
        showUnselectedLabels: true),

    // appBarTheme: AppBarTheme(
    //     backgroundColor: black,
    //     centerTitle: true,
    //     shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.only(
    //             bottomLeft: Radius.circular(30),
    //             bottomRight: Radius.circular(30)))),

    textTheme: TextTheme(
      titleLarge:
          TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: white),
      titleMedium:
          TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: black),
      titleSmall:
          TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: black),
    ),
  );
}
