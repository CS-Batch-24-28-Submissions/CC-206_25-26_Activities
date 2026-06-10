import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

const MaterialColor sageGreen = MaterialColor(
  0xFF9CAF88,
  {
    50: Color(0xFFEFF3EC),
    100: Color(0xFFD7E0CF),
    200: Color(0xFFBDCBB0),
    300: Color(0xFFA3B691),
    400: Color(0xFF91A67C),
    500: Color(0xFF9CAF88),
    600: Color(0xFF7F8E6F),
    700: Color(0xFF667356),
    800: Color(0xFF4D5840),
    900: Color(0xFF353D2B),
  },
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit 6 Assignment',
      theme: ThemeData(
        primarySwatch: sageGreen,
      ),
      home: const MainNavigation(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    ProfileScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: sageGreen,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Home',
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget _info(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: sageGreen),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(value),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JURISH PAULEEN HITALIA'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/IMG_6022_2.JPG'),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Text(
                    'JURISH PAULEEN HITALIA',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            _info(Icons.email, 'EMAIL', 'jurishpauleen.hitalia@wvsu.edu.ph'),
            _info(Icons.cake, 'BIRTHDAY', 'February 28, 2006'),
            _info(Icons.star, 'HOBBIES', 'Sleeping, Listening to Music, Writing'),
            _info(Icons.music_note, 'FAVORITE ARTIST', 'Frank Ocean'),
            _info(Icons.book, 'FAVORITE BOOK', 'Seven Husbands of Evelyn Hugo'),
            const SizedBox(height: 24),
            const Text(
              'My Biography',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            const Text(
              'I am a dedicated student currently pursuing my degree in Computer Science. '
              'I am also a journalist with 10 years of experience in journalism, where I developed strong skills in writing, storytelling, research, and communication. '
              'Throughout my journey, I learned how to report information accurately and responsibly while sharing meaningful stories with the public. '
              'In my free time, I enjoy exploring new programming languages and building practical applications that can help make everyday tasks easier.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
          ],
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
  final AudioPlayer _audioPlayer = AudioPlayer();

  void _playSound() async {
    await _audioPlayer.play(
      AssetSource('tokay_gecko_sound.mp3'),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pet'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage('assets/images-2.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: _playSound,
              icon: const Icon(Icons.volume_up, size: 28),
              label: const Text('Play Pet Sound', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                backgroundColor: sageGreen,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
