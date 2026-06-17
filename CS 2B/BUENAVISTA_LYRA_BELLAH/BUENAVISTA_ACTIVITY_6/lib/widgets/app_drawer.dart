import 'package:flutter/material.dart';
import '../theme/styles.dart';
import '../screens/about_me.dart';
import '../screens/home_screen.dart';

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
            accountName: const Text(
              'Lyra Bellah A. Buenavista',
              style: TextStyle(fontWeight: FontWeight.w700, fontFamily: 'Poppins'),
            ),
            accountEmail: const Text(
              'West Visayas State University', 
              style: TextStyle(fontFamily: 'Poppins'), 
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/notion.png'),
            ),
          ),
          _item(context, Icons.home, 'Home', 0),
          _item(context, Icons.person, 'About Me', 1),
        ],
      ),
    );
  }

  Widget _item(BuildContext context, IconData icon, String label, int index) {
    final isActive = index == currentIndex;
    return ListTile(
      leading: Icon(icon, color: isActive ? AppColors.navBg : Colors.black54),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: 'Poppins',
          color: isActive ? AppColors.navBg : Colors.black87,
          fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
        ),
      ),
      tileColor: isActive ? AppColors.rowBg : null,
      onTap: () => _navigate(context, index),
    );
  }
}