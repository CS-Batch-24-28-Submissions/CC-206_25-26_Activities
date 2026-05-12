import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gabrielle Ann Concepcion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1A2A4A)),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

// *********************************************
// MAIN SCREEN with Bottom Navigation
// *********************************************

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 77, 27, 37),
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// *********************************************
// PROFILE SCREEN
// *********************************************

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const Color headerColor = Color(0xFF1A2A4A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 77, 27, 37),
        title: const Text(
          'GABRIELLE ANN CONCEPCION',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF4F4F4),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile picture + name
            Container(
              color: Colors.white, //sa may pfp and name
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundImage: AssetImage('assets/Concepcion.png'),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Gabrielle Ann Concepcion',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Info rows
            Container(
              color:  Colors.white,
              child: Column(
                children: const [
                  _InfoRow(
                    icon: Icons.cake_outlined,
                    label: 'Birthdate',
                    value: 'December 8, 2005',
                  ),
                  _InfoRow(
                    icon: Icons.home_outlined,
                    label: 'Address',
                    value: 'Lupo, Altavas, Aklan',
                  ),
                  _InfoRow(
                    icon: Icons.email_outlined,
                    label: 'Email',
                    value: 'gabrielleann.concepcion@wvsu.edu.ph',
                  ),
                  _InfoRow(
                    icon: Icons.phone_outlined,
                    label: 'Phone Number',
                    value: '0991 874 3961',
                  ),
                  _InfoRow(
                    icon: Icons.school_outlined,
                    label: 'Education',
                    value: 'West Visayas State University',
                  ),
                  _InfoRow(
                    icon: Icons.computer_outlined,
                    label: 'Course',
                    value: 'Bachelor of Science in Computer Science',
                  ),
                  _InfoRow(
                    icon: Icons.favorite_border,
                    label: 'Hobbies',
                    value: 'Badminton, Reading, Cycling, Video Games, Watching Video Essays',
                    isLast: true,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Biography
            Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'My Biography',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  Divider(height: 16),
                  Text(
                    'I am Gabrielle Ann B. Concepcion, a second-year Computer Science Student at West Visayas '
                    'State University Main Campus in Iloilo. I am currently building my foundation in programming, '
                    'software development, and system design as part of my academic journey. '
                    'While I am still exploring my specific interests within the field, I actively enagage in '
                    'hands-on learning through projects, problem-solving, and experimenting with different technologies. '
                    'Outside of my studies, I enjoy playing badminton and keeping up with the latest video games. '
                    'I also like watching video essays, analysis, and commentary content on YouTube, as it allows me '
                    'to see things from different angles and better understand the media I consume.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF555555),
                      height: 1.7,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

// Info Row Widget
class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isLast;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8EEF8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 18, color: const Color.fromARGB(255, 77, 27, 37)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      value,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (!isLast)
          const Divider(height: 1, indent: 64, endIndent: 16),
      ],
    );
  }
}

// *********************************************
// HOME SCREEN
// *********************************************

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool _isPlaying = false;
  late AnimationController _waveController;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
  }

  @override
  void dispose() {
    _waveController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playSound() {
    if (_isPlaying) return;
    setState(() => _isPlaying = true);
    _waveController.repeat(reverse: true);
    _audioPlayer.play(AssetSource('sounds/bark.mp3'));

    // Simulate sound duration
    Future.delayed(const Duration(milliseconds: 1400), () {
      if (mounted) {
        setState(() => _isPlaying = false);
        _waveController.stop();
        _waveController.reset();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 77, 27, 37),
        title: const Text(
          'HOME',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF4F4F4),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Pet picture card
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    color: const Color.fromARGB(255, 77, 27, 37),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 10),
                    child: const Text(
                      'My Pet',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 220,
                    color: const Color(0xFFE8F4E8),
                    child: Image.asset('assets/Hudson.jpg', fit: BoxFit.contain),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Play sound button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isPlaying ? null : _playSound,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 77, 27, 37),
                  disabledBackgroundColor: const Color.fromARGB(255, 50, 17, 24),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ // Animated sound wave bars
                    _SoundWaveBars(
                      controller: _waveController,
                      isPlaying: _isPlaying,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      _isPlaying ? 'Playing...' : 'Play Pet Sound',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            if (_isPlaying) ...[
              const SizedBox(height: 8),
              const Text(
                '! 🐾Woof!',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// Animated sound wave bars widget
class _SoundWaveBars extends StatelessWidget {
  final AnimationController controller;
  final bool isPlaying;

  const _SoundWaveBars({
    required this.controller,
    required this.isPlaying,
  });

  @override
  Widget build(BuildContext context) {
    final List<double> heights = [8, 14, 18, 14, 8];
    final List<double> delays = [0.0, 0.1, 0.2, 0.3, 0.4];

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(5, (i) {
        if (!isPlaying) {
          return Container(
            width: 3,
            height: heights[i],
            margin: const EdgeInsets.symmetric(horizontal: 1.5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2),
            ),
          );
        }
        return AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            final t = (controller.value + delays[i]) % 1.0;
            final scale = 0.5 + (0.8 * (1 - (t - 0.5).abs() * 2).clamp(0.0, 1.0));
            return Container(
              width: 3,
              height: heights[i] * scale,
              margin: const EdgeInsets.symmetric(horizontal: 1.5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
            );
          },
        );
      }),
    );
  }
}