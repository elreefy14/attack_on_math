import 'package:flutter/material.dart';

import 'my_color.dart';

ThemeData lighTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFFffffff),
  primarySwatch: Colors.deepOrange,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    color: Colors.white,
    iconTheme: IconThemeData(
      color: Color(0xFF2B2D42),
    ),
  ),
  bottomNavigationBarTheme:  const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defaultColor,
      unselectedItemColor: Colors.grey,
      elevation: 10.0,
      backgroundColor: Colors.white),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontFamily: 'Metropolis-Medium',
      fontSize: 14.0,
      color: MyColors.secondaryFontColor,
    ),
    headline1: TextStyle(
        fontFamily: 'Metropolis-ExtraBold',
        fontSize: 30,
        color: primaryFontColor),
    headline2: TextStyle(
        fontFamily: 'Metropolis-Bold', fontSize: 16, color: primaryFontColor),
    headline3: TextStyle(
        fontFamily: 'Metropolis-Light', fontSize: 30, color: primaryFontColor),
    bodyText2: TextStyle(
        fontFamily: 'Metropolis-Regular',
        fontSize: 14,
        color: secondaryFontColor),
    headline4: TextStyle(
        fontFamily: 'Metropolis-SemiBold',
        fontSize: 14,
        color: primaryFontColor),
  ),
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFF2B2D42),
  appBarTheme: const AppBarTheme(
    color: Color(0xFF2B2D42),
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  primarySwatch: Colors.deepOrange,
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontFamily: 'Metropolis-Medium',
      fontSize: 14.0,
      color: Colors.white,
    ),
    headline1: TextStyle(
        fontFamily: 'Metropolis-ExtraBold', fontSize: 30, color: Colors.white),
    headline2: TextStyle(
        fontFamily: 'Metropolis-Bold', fontSize: 16, color: Colors.white),
    headline3: TextStyle(
        fontFamily: 'Metropolis-Light', fontSize: 30, color: Colors.white),
    bodyText2: TextStyle(
        fontFamily: 'Metropolis-Regular', fontSize: 14, color: Colors.white),
    headline4: TextStyle(
        fontFamily: 'Metropolis-SemiBold', fontSize: 14, color: Colors.white),
  ),
);
