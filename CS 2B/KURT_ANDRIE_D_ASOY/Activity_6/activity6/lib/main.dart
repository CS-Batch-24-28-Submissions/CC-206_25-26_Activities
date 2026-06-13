import 'package:activity6/pages/about_me.dart';
import 'package:activity6/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}


class _MainAppState extends State<MainApp> {
  int selectedIndex = 0;

  static const List<Widget> pages = [
    Home(),
    AboutMe(),
  ];

  void onTap(int index) {
  setState(() {
    selectedIndex = index;
  });
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 8,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              activeIcon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              activeIcon: Icon(Icons.person_rounded),
              label: 'About Me',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.blue[800],
          unselectedItemColor: Colors.grey[600],
          selectedFontSize: 14,
          unselectedFontSize: 12,
          onTap: onTap,
        ),
      ),
    );
  }
}
