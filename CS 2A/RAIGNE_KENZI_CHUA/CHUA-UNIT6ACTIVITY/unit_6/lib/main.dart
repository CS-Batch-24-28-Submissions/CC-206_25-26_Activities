import 'package:catppuccin_flutter/catppuccin_flutter.dart';
import 'package:flutter/material.dart';
import 'package:unit_6/theme.dart';
import 'home.dart';
import 'profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      theme: catppuccinTheme(catppuccin.macchiato),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('KENZI CHUA'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Profile'),
              Tab(text: 'Home'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
              Profile(),
              Home(),
          ],
        ),
      ),
    );
  }
}