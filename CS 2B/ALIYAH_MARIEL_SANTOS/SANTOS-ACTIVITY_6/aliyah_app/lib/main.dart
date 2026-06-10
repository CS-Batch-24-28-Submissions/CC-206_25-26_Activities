import 'package:flutter/material.dart';
import 'package:aliyah_app/theme/app_colors.dart';
import 'package:aliyah_app/screens/home_screen.dart';
import 'package:aliyah_app/screens/profile_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});
  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;
  static const List<Widget> _screens = <Widget>[HomeScreen(), ProfileScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The AppBar (Header)
      appBar: AppBar(
        title: const Text(
          "Aliyah Mariel Santos",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.primaryPurple,
        foregroundColor: AppColors.cardWhite,
      ),

      // The body changes based on the index
      body: _screens[_selectedIndex],

      // Bottom Tab Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,

        // Bar Styling
        backgroundColor: AppColors.primaryPurple,
        type: BottomNavigationBarType.fixed, // Keeps background color visible
        showUnselectedLabels: true,

        // Selected State (Active)
        selectedItemColor: AppColors.cardWhite,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),

        // Unselected State (Inactive)
        unselectedItemColor: AppColors.accentPurple.withValues(alpha: 0.7),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
