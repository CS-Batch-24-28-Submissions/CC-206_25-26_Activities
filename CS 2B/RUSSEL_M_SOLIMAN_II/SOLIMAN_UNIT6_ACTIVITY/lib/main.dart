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
      title: 'Pet & Profile App',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green[700],
        colorScheme: const ColorScheme.dark(
          primary: Colors.green,
          secondary: Colors.greenAccent,
          surface: Color(0xFF1e1e1e),
        ),
        cardTheme: const CardThemeData(
          elevation: 4.0,
          color: Color(0xFF252525),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          elevation: 4,
        ),
        drawerTheme: const DrawerThemeData(backgroundColor: Color(0xFF1a1a1a)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      initialRoute: '/profile',
      routes: {
        '/pet': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
      themeMode: ThemeMode.dark,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  static Widget buildDrawer(BuildContext context) {
    return NavigationDrawer(
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: Colors.green),
          child: Text(
            "Pet & Profile",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text("Profile"),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.pets),
          title: const Text("Pet"),
          onTap: () {
            Navigator.pop(context);
            if (ModalRoute.of(context)?.settings.name != '/') {
              Navigator.pushReplacementNamed(context, '/');
            }
          },
        ),
      ],
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> _playPetSound() async {
    await _audioPlayer.play(AssetSource('sounds/aggressive cat sound.mp3'));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pet")),
      drawer: HomeScreen.buildDrawer(context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // pet image card
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/images.jpg',
                    width: 280,
                    height: 280,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // SOUND BUTTON (B)
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: _playPetSound,
                icon: const Icon(Icons.volume_up),
                label: const Text(
                  "Play Pet Sound",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Russel Soliman II")),
      drawer: HomeScreen.buildDrawer(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Profile",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Profile picture and name
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 48,
                      backgroundImage: AssetImage("assets/images/Profile.jpg"),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Text(
                        "Russel Soliman II",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // info section
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Information",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ..._buildInfoRow(
                      context,
                      icon: Icons.email,
                      label: "Email",
                      value: "russelii.soliman@wvsu.edu.ph",
                    ),
                    const Divider(height: 16),
                    ..._buildInfoRow(
                      context,
                      icon: Icons.cake,
                      label: "Birthday",
                      value: "July 9, 2005",
                    ),
                    const Divider(height: 16),
                    ..._buildInfoRow(
                      context,
                      icon: Icons.location_on,
                      label: "Location",
                      value: "Iloilo City, Philippines",
                    ),
                    const Divider(height: 16),
                    ..._buildInfoRow(
                      context,
                      icon: Icons.school,
                      label: "Education",
                      value: "BS Computer Science",
                    ),
                    const Divider(height: 16),
                    ..._buildInfoRow(
                      context,
                      icon: Icons.work,
                      label: "Profession",
                      value: "Student",
                    ),
                    const Divider(height: 16),
                    ..._buildInfoRow(
                      context,
                      icon: Icons.favorite,
                      label: "Hobbies",
                      value: "Studying, Sleeping, Playing Video Games",
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Biography
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "My Biography",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "I am a Student at West Visayas State University. I'm currently taking BS Computer Science and so far it's going well. "
                      "I have been learning about database management, "
                      "programming languages, and software development."
                      " In my free time, I like to play video games, listen to music, and spend time with my friends and family."
                      " I am passionate about technology and hope to pursue a career in data science after graduation.",
                      style: const TextStyle(fontSize: 14),
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

  List<Widget> _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return [
      Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 16),
          Expanded(
            flex: 1,
            child: Text(
              label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(value, style: const TextStyle(fontSize: 14)),
          ),
        ],
      ),
    ];
  }
}
