// ignore_for_file: use_build_context_synchronously

// [IMPORT] Packages
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tan Unit6 - My Pet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E3A8A),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
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
  int _currentIndex = 0;
  final AudioPlayer _audioPlayer = AudioPlayer();
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreen(onPlaySound: _playPetSound),
      const ProfileScreen(),
    ];
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playPetSound() async {
    try {
      await _audioPlayer.play(AssetSource('sounds/sfx_cat_meow.mp3'));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Meow!'),
          duration: Duration(seconds: 1),
          backgroundColor: Color(0xFF1E3A8A),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Sound error: $e\nCheck file name and pubspec.yaml'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: const Color(0xFF1E3A8A),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
      ),
    );
  }
}

// [HOME SCREEN]
class HomeScreen extends StatelessWidget {
  final VoidCallback onPlaySound;

  const HomeScreen({super.key, required this.onPlaySound});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Pet',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFF1E3A8A),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // [IMAGE] Pet
              _PetImage(),

              const SizedBox(height: 40),

              // [TEXT] Pet Details
              const Text(
                'My Cat',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF1F2937)),
              ),
              const SizedBox(height: 8),
              const Text(
                'She loves to meow and play!',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),

              const SizedBox(height: 50),

              // [BUTTON] Meow sound
              ElevatedButton.icon(
                onPressed: onPlaySound,
                icon: const Icon(Icons.volume_up_rounded, size: 34),
                label: const Text(
                  'Play Meow Sound',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E3A8A),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                  elevation: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// [WIDGET] Pet Image: Rounded card displaying Luna's photo with a subtle drop shadow.
class _PetImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      height: 290,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1E3A8A).withValues(alpha: 0.15),
            blurRadius: 20,
            spreadRadius: 6,
            offset: const Offset(0, 10),
          ),
        ],
        image: const DecorationImage(
          image: AssetImage('assets/images/cat.webp'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}