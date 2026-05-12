import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MICHAEL JOHN D. RAMOS',
      debugShowCheckedModeBanner: false, // hide red "DEBUG" banner
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
        primary: Color.fromARGB(255, 119, 119, 119),
        onPrimary: Color.fromARGB(255, 45, 0, 167), 
      ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 21, 14, 202), 
          foregroundColor: Color.fromARGB(255, 242, 242, 255),  
          elevation: 0,
        ),
        textTheme: Typography.whiteMountainView,
      ),
      home: const MainWrapper(), // holds bottom nav logic
    );
  }
}

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {

  int _currentIndex = 0;

  // List of screens
  final List<Widget> _screens = [
    const HomeScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Display whichever screen matches the selected tab
      body: _screens[_currentIndex],

      // Bottom navigation bar with two tabs
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: const Color.fromARGB(255, 45, 0, 167),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        onTap: (index) {
          
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}