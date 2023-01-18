// ignore_for_file: unnecessary_import

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:reducer/views/home_page.dart';
import 'Theme/theme_data.dart';
import 'provider/dark_theme_provider.dart';

void main() async {
  // Initializing our App
  WidgetsFlutterBinding
      .ensureInitialized(); // Using this to ensure our Bindings are initialized
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Using Provider to set our Light and Dark theme
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    // Getting the current theme during Widget initialization
    getCurrentTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        }),
      ],
      child: Consumer<DarkThemeProvider>(builder: (context, themeData, child) {
        return Consumer<DarkThemeProvider>(
            builder: (context, themeData, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'FlutterTest',
            // Setting our App Theme
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: const HomeScreen(), // Returning the home widget
          );
        });
      }),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
