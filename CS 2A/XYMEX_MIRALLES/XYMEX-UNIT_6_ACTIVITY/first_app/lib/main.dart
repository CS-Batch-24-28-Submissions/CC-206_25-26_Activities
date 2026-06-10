import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'decorations.dart';
import 'screens/about_me_screen.dart';
import 'screens/pet_screen.dart';

void main() {
  runApp(MyApp());
}

//MAIN
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Color.fromRGBO(210, 158, 103, 100),
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(210, 158, 103, 100),
            titleSpacing: 4.0,
            title: Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 20,
                right: 70,
              ),
              decoration: monitorScreenDec,
              child: Text(
                "About me...",
                style: GoogleFonts.sixtyfour(
                  color: Colors.white,
                  letterSpacing: 3,
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                child: Container(
                  decoration: monitorScreenDec,
                  child: TabBar(
                    dividerHeight: 0,
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(icon: Icon(Icons.cases_rounded, color: Colors.white)),
                      Tab(icon: Icon(Icons.pets, color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ), //Tab Bar
          ), // AppBar
          body: TabBarView(
            children: [
              AboutMeScreen(), // Main Screen
              PetScreen(), // Pet Screen
            ],
          ), // Tabs
        ),
      ),
    );
  }
}
