import 'package:flutter/material.dart';
import 'screens/main_navigation.dart';
import 'colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.green600,
          primary: AppColors.green600,
        ),
        useMaterial3: true,
      ),
      home: const MainNavigation(),
    );
  }
}