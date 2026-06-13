import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'home_screen.dart';
import 'utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile',
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
  int _currentIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //indexed stack keeps the state of each screen intact when navigating between them
      body: IndexedStack(
        index: _currentIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.petal100, width: 1),
          ),
        ),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: AppColors.sage100,
            //this define text styles for selected and unselected states
            labelTextStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return const TextStyle(
                  fontSize: 12, 
                  fontWeight: FontWeight.bold, 
                  color: AppColors.sage700,
                );
              }
              return const TextStyle(fontSize: 12, color: AppColors.pinkMist300);
            }),
          ),
          //navbar 
          child: NavigationBar(
            selectedIndex: _currentIndex,
            onDestinationSelected: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            backgroundColor: AppColors.pinkMist50,
            elevation: 0,
            height: 70,
            destinations: const [ //items in te navbar
              NavigationDestination(
                icon: Icon(Icons.home_outlined, color: AppColors.pinkMist300),
                selectedIcon: Icon(Icons.home_rounded, color: AppColors.sage700),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline_rounded, color: AppColors.pinkMist300),
                selectedIcon: Icon(Icons.person_rounded, color: AppColors.sage700),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}