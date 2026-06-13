import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'profile_screen.dart'; // keep profile separate for clarity

/// This file defines the HomeScreen widget, which displays information about the user's pet and includes a button to play a sound.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AudioPlayer _player = AudioPlayer();
  bool _isPlaying = false;

  Future<void> _toggleSound() async {
    if (_isPlaying) {
      await _player.stop();
      setState(() => _isPlaying = false);
    } else {
      await _player.play(AssetSource("audio/mycats_audio.mp3"));
      setState(() => _isPlaying = true);
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  /// This is the main build method for the HomeScreen, which contains a header, pet card with image and caption, and a button to play or stop the pet sound.
  /// The layout is designed to be visually appealing with a gradient header, rounded card, and consistent styling. The SingleChildScrollView allows for scrolling if content overflows on smaller screens.
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Gradient header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 247, 129, 11),
                  Color.fromARGB(255, 255, 200, 100),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: const Text(
              "My Pet",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Pet card with 0.5 inch margin (≈48 px)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Full image with rounded corners
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/images/mycats_image.jpg",
                        height: 400,
                        width: double.infinity,
                        fit: BoxFit.contain, // show whole image
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Caption text before the button
                    const Text(
                      "Meet my cats, Wander, Orange, and Mika",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton.icon(
                      onPressed: _toggleSound,
                      icon: Icon(_isPlaying ? Icons.stop : Icons.volume_up),
                      label: Text(_isPlaying ? "Stop Sound" : "Play My Cats Sound"),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

  /// This is the main navigation widget that manages the bottom navigation bar and switches between the ProfileScreen and HomeScreen based on user selection. It uses a StatefulWidget to maintain the state of the selected index and updates the displayed screen accordingly.
  class MainNavigation extends StatefulWidget {
    const MainNavigation({super.key});

    @override
    State<MainNavigation> createState() => _MainNavigationState();
  }

  class _MainNavigationState extends State<MainNavigation> {
    int _selectedIndex = 0;

    final List<Widget> _screens = const [
      ProfileScreen(), // left tab
      HomeScreen(),    // right tab
    ];

    void _onItemTapped(int index) {
      setState(() => _selectedIndex = index);
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: const Color.fromARGB(255, 247, 129, 11),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pets),
              label: "My Pet",
            ),
          ],
        ),
      );
    }
  }
