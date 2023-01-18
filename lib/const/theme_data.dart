import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      fontFamily: 'Nunito',
      platform: TargetPlatform.iOS,
      scaffoldBackgroundColor:
          isDarkTheme ? Colors.black : Colors.grey.shade300,
      primaryColor: Color(0xFFEB6440),
      accentColor: isDarkTheme ? const Color(0xFF151515) : Colors.transparent,
      backgroundColor:
          isDarkTheme ? const Color.fromARGB(255, 0, 0, 0) : Colors.white,
      indicatorColor: isDarkTheme ? Colors.white : const Color(0xFF545d5C),
      buttonColor: isDarkTheme ? Colors.white : const Color(0xff323232),
      hintColor: isDarkTheme ? Colors.grey.shade300 : Colors.grey.shade800,
      highlightColor: isDarkTheme ? Colors.white30 : const Color(0xffFCE192),
      hoverColor:
          isDarkTheme ? const Color(0xff3A3A3B) : const Color(0xff4285F4),
      focusColor: isDarkTheme ? Colors.black : const Color(0xFFE0E0E0),
      disabledColor: isDarkTheme ? Colors.transparent : const Color(0xFF151515),
      cardColor: isDarkTheme ? const Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        backgroundColor: isDarkTheme ? Colors.black : Colors.white,
      ),
      textTheme: TextTheme(
          bodyText2: TextStyle(
              fontSize: 12.0,
              color: isDarkTheme ? Colors.white : Colors.black)),
      cupertinoOverrideTheme: const CupertinoThemeData(
        primaryColor: Color(0xFFEB6440),
      ),
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: Color(0xFFEB6440),
          selectionHandleColor: Color(0xFFEB6440),
          selectionColor: isDarkTheme
              ? Color.fromARGB(55, 255, 255, 255)
              : Color.fromARGB(64, 0, 0, 0)),
    );
  }
}
