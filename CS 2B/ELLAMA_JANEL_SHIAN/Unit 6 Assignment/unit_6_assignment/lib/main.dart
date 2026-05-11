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
      title: 'CC 206 Assignment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const MainNavigationScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ---------------------------------------------------------
// Navigation Screen (Handles switching between Profile and Home)
// ---------------------------------------------------------
class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  // List of screens to navigate between
  static const List<Widget> _screens = <Widget>[
    ProfileScreen(),
    PetHomeScreen(),
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'My Pet',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

// ---------------------------------------------------------
// Profile Screen
// ---------------------------------------------------------
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Header containing the title
      appBar: AppBar(
        title: const Text('About Me'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // Screen body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture and Name Row 
            Row(
              children: [
                const CircleAvatar(
                  radius: 50,
                  // Profile Picture
                  backgroundImage: AssetImage('assets/images/profile.jpg'), 
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    'Janel Shian E. Ellama',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // 5 Information Sections
            const Text(
              'Get to know me!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildInfoCard(Icons.email, 'Email', 'janelshian.ellama@wvsu.edu.ph'),
            _buildInfoCard(Icons.cake, 'Birthdate', 'October 25, 2004'),
            _buildInfoCard(Icons.home, 'Address', 'Brgy. Igtuble, Tubungan, Iloilo'),
            _buildInfoCard(Icons.school, 'Education', 'West Visayas State University'),
            _buildInfoCard(Icons.favorite, 'Hobbies', 'Motorcycle, Anime, Sleeping'),

            const SizedBox(height: 30),

            // Biography Section
            const Text(
              'My Biography',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Growing up in Brgy.Igtuble, I have always been fascinated by technology. '
                'I am currently a Computer Science student, passionate about software development '
                'and creating applications that solve real-world problems. In my free time, '
                'I enjoy riding my motorcycle, watching anime, and spending time with my pet Fluffy. '
                'I strive to continuously learn and improve my skills as a future developer.',
                style: TextStyle(fontSize: 16, height: 1.5),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable widget for the information rows [cite: 11]
  Widget _buildInfoCard(IconData icon, String title, String data) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, size: 30, color: Colors.blueGrey),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(data),
      ),
    );
  }
}

// ---------------------------------------------------------
// Home Screen (Pet Screen)
// ---------------------------------------------------------
class PetHomeScreen extends StatefulWidget {
  const PetHomeScreen({super.key});

  @override
  State<PetHomeScreen> createState() => _PetHomeScreenState();
}

class _PetHomeScreenState extends State<PetHomeScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  void _playSound() async {
    // Plays the embedded local audio asset 
    await _audioPlayer.play(AssetSource('audio/pet_sound.mp3')); 
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Meet Fluffy!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 20), // Adds a little space between text and image
              // A picture of pet 
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    )
                  ],
                  image: const DecorationImage(
                    image: AssetImage('assets/images/pet.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              
              // Button that plays a sound 
              ElevatedButton.icon(
                onPressed: _playSound,
                icon: const Icon(Icons.volume_up, size: 30),
                label: const Text(
                  'Play Pet Sound',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}