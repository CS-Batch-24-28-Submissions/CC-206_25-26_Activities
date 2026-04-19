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
      // We still set our shell as the home page
      home: const MainScreen(),
    );
  }
}

// 1. Changed to a StatefulWidget to keep track of the selected page
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // 2. This variable remembers which page we are currently looking at (0 = Home, 1 = Profile)
  int _selectedIndex = 0;

  // 3. This list holds the actual screens we want to show
  final List<Widget> _pages = [
    const HomeScreen(),
    const ProfileScreen(title: 'Jose Alfonso Dolutan'),
  ];

  // 4. This function runs when you tap a menu item in the drawer
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
      
      // 5. Here is our new Drawer!
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // Removes the weird gap at the top of the drawer
          children: [
            // The colored header at the top of the menu
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              child: const Text(
                'Drawer',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Menu Item 1: Home/Bogart
            ListTile(
              leading: const Icon(Icons.pets),
              title: const Text('Home'),
              selected: _selectedIndex == 0, // Highlights the item if it's currently active
              onTap: () => _onItemTapped(0), // Tells the app to load page 0
            ),
            // Menu Item 2: Profile
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              selected: _selectedIndex == 1,
              onTap: () => _onItemTapped(1), // Tells the app to load page 1
            ),
          ],
        ),
      ),
      
      // 6. The body simply displays whichever page matches our _selectedIndex
      body: _pages[_selectedIndex],
    );
  }
}