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
      title: 'Flutter Assignment',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainNavigation(),
    );
  }
}

// --- NAVIGATION SCREEN ---
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  // List of screens to navigate between
  final List<Widget> _screens = [
    const ProfileScreen(),
    const PetScreen(),
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
            label: 'My Pet',
          ),
        ],
      ),
    );
  }
}

// --- SCREEN A: PROFILE SCREEN ---
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // A profile screen with components 
    return Scaffold(
      // A header that contains the title [cite: 3]
      appBar: AppBar(
        title: const Text('William Labrador Jr'),
      ),
      // A screen body [cite: 4]
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile picture, and on the right side is your full name [cite: 5]
            Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/profile.jpeg'), // Update with your image
                ),
                const SizedBox(width: 16),
                const Text(
                  'William Labrador Jr',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(height: 40),
            
            // At least 5 sections containing an Icon, descriptive text, and data [cite: 6, 7, 8]
            _buildInfoRow(Icons.email, 'Email', 'william.labrador@wvsu.edu.ph'),
            _buildInfoRow(Icons.cake, 'Birthday', 'September 20, 2005'),
            _buildInfoRow(Icons.school, 'Course', 'Bachelor of Science in Computer Science'),
            _buildInfoRow(Icons.gamepad, 'Hobbies', 'PC Gaming, Photography, DIY Repair'),
            _buildInfoRow(Icons.code, 'Skills', 'Java, C++, Image Manipulation, Video Editing'),

            const Divider(height: 40),

            // A biography section which contains a title and a 1 paragraph description [cite: 9, 10]
            const Text(
              'My Biography',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'As a Computer Science student, I have always been fascinated by both software optimization and hardware repair. When I am not debugging code or fixing my devices, I spend my time exploring photography and editing my shots. I also enjoy modifying and optimizing PC games to get the best frame rates possible. I am constantly looking to learn new technical skills and improve my craft.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget to build the 3-component rows cleanly
  Widget _buildInfoRow(IconData icon, String title, String data) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 28, color: Colors.blueGrey),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              data,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

// --- SCREEN B: HOME (PET) SCREEN ---
class PetScreen extends StatefulWidget {
  const PetScreen({super.key});

  @override
  State<PetScreen> createState() => _PetScreenState();
}

class _PetScreenState extends State<PetScreen> {
  // Initialize the audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  void _playSound() async {
    // Make sure the path matches your actual file in the assets folder
    await _audioPlayer.play(AssetSource('sounds/purr.mp3'));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // A Home Screen where it displays two big components 
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pet'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // A) A picture of your pet 
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/pet.jpg', // Update with your pet's image
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            
            const SizedBox(height: 16), // Spacing between image and name
            
            // --- NEW: Pet Name Added Here ---
            const Text(
              'Gwen Janna',
              style: TextStyle(
                fontSize: 28, 
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 24), // Spacing between name and button
            
            // B) A button that plays a sound similar to the sound made by your pet
            ElevatedButton.icon(
              onPressed: _playSound,
              icon: const Icon(Icons.volume_up),
              label: const Text('Play Sound', style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}