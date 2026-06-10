import 'package:andicoy_activity_6/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:andicoy_activity_6/profile/profile_screen.dart';
import 'package:andicoy_activity_6/profile/home_screen.dart';
import 'package:andicoy_activity_6/profile/app_drawer.dart';

void main() {
  runApp(const MyProfileApp());
}

class MyProfileApp extends StatelessWidget {
  const MyProfileApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile & Home',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const HomeScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
