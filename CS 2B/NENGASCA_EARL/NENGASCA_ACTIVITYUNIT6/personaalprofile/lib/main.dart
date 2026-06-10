import 'package:flutter/material.dart';
import 'profile.dart';
import 'home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
         debugShowCheckedModeBanner: false,
        theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:const Color.fromARGB(255, 71, 224, 241)),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
                   Profilescreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
     
      bottomNavigationBar: BottomNavigationBar(



  currentIndex: _selectedIndex,
  onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        unselectedItemColor: const Color.fromARGB(196, 118, 118, 118),
        backgroundColor:const Color.fromARGB(150, 97, 232, 225),
       


      ///NAV BAR ITEMS MUST CONSITS OF HOME AND PROFILE ONLY
        items: const [
          BottomNavigationBarItem(
         
            label: 'Pet',
               icon: Icon(Icons.home_outlined),
     activeIcon: Icon(Icons.home),

          ),
          BottomNavigationBarItem(
            
            label: 'Profile',
            icon: Icon(Icons.person_outline),
        activeIcon: Icon(Icons.person),
          ),


        ],
      ),
    );
  }
}