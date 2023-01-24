import 'package:flutter/material.dart';

import 'dev_page.dart';
import 'home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pages = const [HomeScreen(), DevPage()];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Test",
          style: TextStyle(
            color: Theme.of(context).buttonColor,
            fontSize: 18,
          ),
        ),
      ),
      body: pages[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          // indicatorColor: Colors.blue.shade200,
          labelTextStyle: MaterialStateProperty.all(const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          )),
        ),
        child: NavigationBar(
            selectedIndex: index,
            height: 80,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.home_filled),
                  label: 'Home',
                  selectedIcon: Icon(Icons.home_filled)),
              NavigationDestination(
                  icon: Icon(Icons.code),
                  label: 'Dev',
                  selectedIcon: Icon(Icons.code)),
            ]),
      ),
    );
  }
}
