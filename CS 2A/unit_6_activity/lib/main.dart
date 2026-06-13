import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color neonGreen = Color(0xFF39FF14);

    return MaterialApp(
      title: 'CC 206 Assignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: neonGreen,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1F1F1F),
          titleTextStyle: TextStyle(
              color: neonGreen, fontSize: 20, fontWeight: FontWeight.bold),
          iconTheme: IconThemeData(color: neonGreen),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF1F1F1F),
          selectedItemColor: neonGreen,
          unselectedItemColor: Colors.white54,
        ),
        colorScheme: const ColorScheme.dark(
          primary: neonGreen,
          secondary: neonGreen,
        ),
      ),
      home: const MainNavigationScreen(),
    );
  }
}

//  NAVIGATION SCREEN 
class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ProfileScreen(),
    const PetHomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
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

// PROFILE SCREEN 
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MARY ANNE E. LABISCASE'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/Profile.jpg'),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    'MARY ANNE E. LABISCASE',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const InfoRow(
                icon: Icons.cake,
                title: 'Birthdate',
                data: 'February 6, 2006'),
            const InfoRow(
                icon: Icons.location_on,
                title: 'Address',
                data: 'Calinog, Iloilo City, Philippines'),
            const InfoRow(
                icon: Icons.email,
                title: 'Email',
                data: 'maryanne.labiscase@wvsu.edu.ph'),
            const InfoRow(
                icon: Icons.school,
                title: 'Education',
                data: 'West Visayas State University'),
            const InfoRow(
                icon: Icons.favorite,
                title: 'Hobbies',
                data: 'Eating, Gaming, Sleeping, Watching K-Drama'),
            const InfoRow(
                icon: Icons.work,
                title: 'Dream Job',
                data: 'Cybersecurity Analyst or Full Stack Developer'),
            const SizedBox(height: 30),
            const Text(
              'My Biography',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF39FF14),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1F1F1F),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF39FF14), width: 1),
              ),
              child: const Text(
                "I'm a college student from Iloilo City, just trying to survive the semester one deadline at a time. Most of my days are a chaotic mix of classes, coding assignments that definitely don't run on the first try, and convincing myself that I'll start studying early — I never do. When I'm not debugging my life choices, you'll catch me gaming, binge-watching K-Drama, or napping like it's a competitive sport. I share my space with a tiny kitten who has absolutely no respect for my sleep schedule but gets a pass because she's cute. Dreaming big, failing forward, and fueled entirely by determination and the occasional ramen noodles at midnight.",
                style:
                    TextStyle(fontSize: 16, height: 1.5, color: Colors.white70),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//for info rows
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String data;

  const InfoRow({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF1F1F1F),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF39FF14), size: 28),
            const SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                data,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//  SNOWFLAKE 
class Snowflake {
  double x;
  double y;
  double radius;
  double speed;
  double opacity;

  Snowflake({
    required this.x,
    required this.y,
    required this.radius,
    required this.speed,
    required this.opacity,
  });
}

// --- SNOW PAINTER ---
class SnowPainter extends CustomPainter {
  final List<Snowflake> snowflakes;
  final double screenWidth;
  final double screenHeight;

  SnowPainter(this.snowflakes, this.screenWidth, this.screenHeight);

  @override
  void paint(Canvas canvas, Size size) {
    for (final flake in snowflakes) {
      final paint = Paint()
        ..color = Colors.white.withOpacity(flake.opacity)
        ..style = PaintingStyle.fill;
      canvas.drawCircle(Offset(flake.x, flake.y), flake.radius, paint);
    }
  }

  @override
  bool shouldRepaint(SnowPainter oldDelegate) => true;
}

// --- HOME SCREEN 
class PetHomeScreen extends StatefulWidget {
  const PetHomeScreen({super.key});

  @override
  State<PetHomeScreen> createState() => _PetHomeScreenState();
}

class _PetHomeScreenState extends State<PetHomeScreen>
    with SingleTickerProviderStateMixin {
  final AudioPlayer _audioPlayer = AudioPlayer();
  late AnimationController _snowController;
  final List<Snowflake> _snowflakes = [];
  final Random _random = Random();
  double _screenWidth = 1000;
  double _screenHeight = 1000;

  @override
  void initState() {
    super.initState();

    
    for (int i = 0; i < 80; i++) {
      _snowflakes.add(Snowflake(
        x: _random.nextDouble() * 1000, 
        y: _random.nextDouble() * 1000,
        radius: _random.nextDouble() * 4 + 1,
        speed: _random.nextDouble() * 1.5 + 0.5,
        opacity: _random.nextDouble() * 0.6 + 0.2,
      ));
    }

    _screenWidth = 1000; 
    _screenHeight = 1000;

    _snowController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();

    _snowController.addListener(() {
      setState(() {
        for (final flake in _snowflakes) {
          flake.y += flake.speed;
          flake.x += sin(flake.y * 0.02) * 0.5;
          if (flake.y > _screenHeight + 10) {
            flake.y = -10;
            flake.x = _random.nextDouble() * _screenWidth;
          }
        }
      });
    });
  }

  void _playSound() async {
    await _audioPlayer.play(AssetSource('cat.mp3'));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _snowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pet'),
      ),
      body: Stack(
        children: [
          // --- SNOWY BACKGROUND ---
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF0a1628), 
                  Color(0xFF1a2a4a), 
                  Color(0xFF121212), 
                ],
              ),
            ),
          ),

          // --- SNOW ANIMATION LAYER ---
          LayoutBuilder(
            builder: (context, constraints) {
              _screenWidth = constraints.maxWidth;
              _screenHeight = constraints.maxHeight;
              return CustomPaint(
                painter: SnowPainter(_snowflakes, _screenWidth, _screenHeight),
                child: const SizedBox.expand(),
              );
            },
          ),

          // --- PET CONTENT ---
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFF39FF14), width: 3),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF39FF14).withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: Image.asset(
                      'assets/cat.jpg',
                      width: 320, 
                      height: 320, 
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 320,
                          height: 320,
                          color: Colors.grey[800],
                          alignment: Alignment.center,
                          child: const Text('Add cat.jpg to assets/'),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: _playSound,
                  icon: const Icon(Icons.volume_up, color: Colors.black),
                  label: const Text(
                    'Play Pet Sound',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF39FF14),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}