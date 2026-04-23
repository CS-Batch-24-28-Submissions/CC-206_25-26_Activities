import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const Unit6App());
}

class Unit6App extends StatelessWidget {
  const Unit6App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF6C63FF),
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF00D2FF),
          tertiary: const Color(0xFF92FE9D),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white70),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),   
    const ProfileScreen(), 
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF2D3748),
        selectedItemColor: const Color(0xFF6C63FF),
        unselectedItemColor: Colors.white60,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.pets_outlined),
            activeIcon: Icon(Icons.pets),
            label: 'Pet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'About Me',
          ),
        ],
      ),
    );
  }
}
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("JOHANAH NICOLE GERONA REQUINA"),
        backgroundColor: const Color.fromARGB(255, 65, 93, 139), 
        elevation: 4, 
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
              ),
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(
              scrollbarTheme: ScrollbarThemeData(
                thumbColor: MaterialStateProperty.all(const Color(0xFF6C63FF)), 
                trackColor: MaterialStateProperty.all(Colors.white24), 
              ),
            ),
            child: Scrollbar(
              thumbVisibility: true, 
              thickness: 8,
              radius: const Radius.circular(10),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'assets/images/profile.jpg',
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          'Johanah Nicole G. Requina',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    _buildInfoGrid(context),
                    const SizedBox(height: 24),
                    _buildBioCard(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoGrid(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          _buildModernRow(Icons.cake, "Birthday", "June 2, 2006"),
          const Divider(height: 32, color: Colors.white10),
          _buildModernRow(Icons.home, "Address", "San Roque, Anini-y, Antique, Philippines"),
          const Divider(height: 32, color: Colors.white10),
          _buildModernRow(Icons.bolt, "Hobbies", "Watching K-Dramas • Photography • Sleeping"),
          const Divider(height: 32, color: Colors.white10),
          _buildModernRow(Icons.school, "School", "West Visayas State University - Main Campus"),
          const Divider(height: 32, color: Colors.white10),
          _buildModernRow(Icons.flight_takeoff, "Dream Countries", "Iceland • Japan (Tokyo) • Norway • Spain • USA (New York)"),
        ],
      ),
    );
  }

  Widget _buildModernRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF6C63FF).withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: const Color(0xFF6C63FF), size: 20),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label.toUpperCase(),
                style: const TextStyle(fontSize: 10, color: Colors.white38, fontWeight: FontWeight.bold)),
            Text(value,
                style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500)),
          ],
        ),
      ],
    );
  }
}
  Widget _buildBioCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color(0xFF6C63FF).withOpacity(0.2), Colors.transparent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF6C63FF).withOpacity(0.2)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("My Biography",
              style: TextStyle(color: Color(0xFF92FE9D), fontWeight: FontWeight.bold, letterSpacing: 2)),
          SizedBox(height: 12),
          Text(
            "I’m a Computer Science student who finds strength in the people around me, with friends who keep me motivated and family who give me purpose. Even though I’m often seen as quiet, I’d call myself an ambivert because how I act depends on the vibe of the people I’m with. I enjoy deep talks with those I trust, but I also love simple things like taking photos of everyday moments that feel special. When stress comes, I usually step back and rest, but I always find a way to move forward at my own pace. At the end of the day, I try to balance school, relationships, and personal growth while enjoying the small details that make life meaningful.",
            style: TextStyle(fontSize: 16, height: 1.6, color: Colors.white70),
          ),
        ],
      ),
    );
  }
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final player = AudioPlayer(); // audio player for pet sound
  bool _isPlaying = false; // track if audio is playing

  @override
  void dispose() {
    player.dispose(); // release audio resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("My Home"),
        backgroundColor: const Color.fromARGB(255, 65, 93, 139), 
        elevation: 4, 
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF00D2FF).withOpacity(0.15),
                    blurRadius: 40,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  "assets/images/pet.jpg",
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 300,
                    color: Colors.white.withOpacity(0.05),
                    child: const Icon(Icons.pets, size: 100, color: Colors.white10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () async {
                  if (_isPlaying) {
                    await player.stop(); // stop audio when playing
                    setState(() => _isPlaying = false);
                  } else {
                    await player.play(AssetSource("audio/pet_sound.mp3")); // play audio from assets
                    setState(() => _isPlaying = true);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isPlaying ? Colors.redAccent : const Color(0xFF6C63FF),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(_isPlaying ? Icons.stop_rounded : Icons.play_arrow_rounded, size: 28), 
                    const SizedBox(width: 10),
                    Text(
                      _isPlaying ? "STOP" : "PLAY",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

