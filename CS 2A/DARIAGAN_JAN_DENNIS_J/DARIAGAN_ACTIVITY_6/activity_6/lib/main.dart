import 'package:flutter/material.dart';
import 'screens/pet_screen.dart';

/// This is the main entry point of the application, which runs the MyProfileApp widget.
void main() {
  runApp(const MyProfileApp());
}

/// This is the main application widget, which sets up the MaterialApp and defines the home screen as MainNavigation.
class MyProfileApp extends StatelessWidget {
  const MyProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My Profile App',
      home: MainNavigation(),
    );
  }
}
