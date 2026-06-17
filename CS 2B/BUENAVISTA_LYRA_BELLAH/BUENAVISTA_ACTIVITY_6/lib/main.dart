import 'package:flutter/material.dart';
import 'theme/styles.dart';
import './screens/about_me.dart';
import './screens/home_screen.dart';

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
        fontFamily: 'Poppins',
      ),
      home: const HomeScreen(),
    );
  }
}

// -- drawer --
class AppDrawer extends StatelessWidget {
  final int currentIndex;
  const AppDrawer({super.key, required this.currentIndex});

  void _navigate(BuildContext context, int index) {
    Navigator.pop(context);
    if (index == currentIndex) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => index == 0 ? const HomeScreen() : const AboutMeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.cardBg,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: AppColors.navBg),
            accountName: const Text( 'Lyra Bellah A. Buenavista', 
            style: TextStyle(fontWeight: FontWeight.bold), 
            ),
            accountEmail: const Text('lyrabellahbuenavista@gmail.com'),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/pfp.jpg'),
            ),
          ),
          _drawerItem(context, Icons.home, 'Home', 0),
          _drawerItem(context, Icons.person, 'About Me', 1),
        ],
      ),
    );
  }

  Widget _drawerItem(BuildContext context, IconData icon, String label, int index) {
    final isActive = index == currentIndex;
    return ListTile(
      leading: Icon(icon, color: isActive ? AppColors.navBg : Colors.black54),
      title: Text(
        label,
        style: TextStyle(
          color: isActive ? AppColors.navBg : Colors.black87,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      tileColor: isActive ? AppColors.rowBg : null,
      onTap: () => _navigate(context, index),
    );
  }
}