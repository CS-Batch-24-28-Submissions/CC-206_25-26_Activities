import 'package:flutter/material.dart';
import 'widgets/tab_bar.dart';
import 'package:simpe_flutter_application/style/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Profile and Pet",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: MainTabBar(),
    );
  }
}
