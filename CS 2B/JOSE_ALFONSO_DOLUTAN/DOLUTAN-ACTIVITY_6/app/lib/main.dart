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
      title: 'Jose Alfonso Dolutan - Portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
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
  int _selectedIndex = 1; // this allows us to start at the Profile Screen first

  final List<Widget> _pages = [ // list of all pages in this application
    const HomeScreen(),
    const ProfileScreen(title: 'Jose Alfonso Dolutan'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the active page
    });
    Navigator.pop(context); // Close the drawer automatically after clicking
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Jose Alfonso Dolutan'),
      ),
      
      drawer: Drawer( // chose to use the drawer (because mainly its for a desktop appplication)
        child: ListView(
          padding: EdgeInsets.zero, // found a fix online to remove the gap
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              child: const Text(
                'Drawer Menu',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile( // Home Screen
              leading: const Icon(Icons.pets),
              title: const Text('Home'),
              selected: _selectedIndex == 0, // Highlights the item if it's currently active
              onTap: () => _onItemTapped(0), // Tells the app to load page 0
            ),
            ListTile( // Profile Screen
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              selected: _selectedIndex == 1,
              onTap: () => _onItemTapped(1), // Tells the app to load page 1
            ),
          ],
        ),
      ),
      
      body: _pages[_selectedIndex], 
    );
  }
}