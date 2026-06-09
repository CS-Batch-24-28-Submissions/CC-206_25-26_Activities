import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Account Profile',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        fontFamily: 'GoogleSans',
        textTheme: TextTheme(
          headlineLarge: const TextStyle(fontFamily: 'StackSansNotch'),
          titleLarge: const TextStyle(fontFamily: 'StackSansNotch'),
          bodyLarge: const TextStyle(fontFamily: 'GoogleSans'),
          bodyMedium: const TextStyle(fontFamily: 'GoogleSans'),
        ),
      ),
      home: const AppShell(),
    );
  }
}

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _selectedIndex = 0;

  static const _screens = [HomeScreen(), ProfileScreen()];

  static const _titles = ['Home', 'Profile'];

  void _selectScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_selectedIndex])),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.orangeAccent),
              child: Text(
                'Nicholas Robert Saraet\nBSCS 2-A\nUnit 6 Activity',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () => _selectScreen(0),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              selected: _selectedIndex == 1,
              onTap: () => _selectScreen(1),
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          width: 360,
          child: _screens[_selectedIndex],
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AudioPlayer _player = AudioPlayer();

  Future<void> _playPetSound() async {
    await _player.play(AssetSource('audio/pet_sound.mp3'));
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'My Pet',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'assets/images/pet_image.jpg',
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Text(
            'Doggy',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton.icon(
          onPressed: _playPetSound,
          icon: const Icon(Icons.volume_up),
          label: const Text('Meowww'),
        ),
      ],
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Text(value, style: const TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'My Profile',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                'assets/images/profile_picture.png',
                width: 110,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Text(
                'Nicholas Robert Saraet',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Divider(),
        _infoRow(Icons.email, 'Email', 'nicholasrobert.saraet@wvsu.edu.ph'),
        _infoRow(Icons.school, 'School', 'West Visayas State University'),
        _infoRow(Icons.bookmark, 'Course', 'BS Computer Science'),
        _infoRow(Icons.book, 'Hobbies', 'Gaming, Singing'),
        _infoRow(Icons.location_city, 'City', 'Jibao-an, Iloilo'),
        _infoRow(Icons.cake, 'Birthday', 'November 15, 2005'),
        _infoRow(Icons.favorite, 'Status', 'In a relationship'),
        _infoRow(Icons.leaderboard, 'PVZ2 Rank', 'Jade League'),
        const Divider(),
        const SizedBox(height: 16),
        const Text(
          'My Biography',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          'Nicholas is a 20-year-old BS Computer Science student at WVSU. He currently holds the position of Vice Chairperson for External Affairs in the WVSU Panayana Cultural Group and also serves as the organization’s Tenor Voice Representative. During his first year in college, he was also a Junior Student Council Board Member. He continues to strengthen his leadership and musical skills while managing his academic responsibilities, aiming to build a future in either the field of computer science or music.',
          style: TextStyle(fontSize: 16, height: 1.4),
        ),
      ],
    );
  }
}
