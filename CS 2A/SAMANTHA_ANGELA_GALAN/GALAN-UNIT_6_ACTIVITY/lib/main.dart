import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const PetProfileApp());
}

class PetProfileApp extends StatelessWidget {
  const PetProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
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

  // Swapped order: Profile is now index 0 (Landing Page)
  final List<Widget> _screens = [const ProfileScreen(), const HomeScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
          NavigationDestination(icon: Icon(Icons.pets_outlined), label: 'Pet'),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _playPetSound() async {
    final player = AudioPlayer();
    await player.play(AssetSource('cat_sound.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Pet", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/pet.png'), // Pet specific image
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: ElevatedButton.icon(
                onPressed: _playPetSound,
                icon: const Icon(Icons.volume_up),
                label: const Text("PLAY PET SOUND"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
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
      appBar: AppBar(
        title: const Text(
          "Samantha Angela Galan",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    'assets/profile.png',
                  ), // Profile specific image
                ),
                const SizedBox(width: 20),
                const Text(
                  "Samantha Angela Galan",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 30),
            _buildInfoCard([
              _infoRow(Icons.email, "Email:", "samanthaangelagalan@.com"),
              _infoRow(Icons.info, "Program:", "CS 2A Student"),
              _infoRow(Icons.location_on, "Address:", "Iloilo City"),
              _infoRow(Icons.palette, "Hobbies:", "Binge-watching, Sleeping"),
              _infoRow(Icons.favorite, "Favorites:", "Lumpia and Cats"),
            ]),
            const SizedBox(height: 30),
            const Text(
              "My Biography",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.indigo.withOpacity(0.05), // Very light background
                borderRadius: BorderRadius.circular(10),
                border: const Border(
                  left: BorderSide(
                    color: Colors.indigo,
                    width: 4,
                  ), // A nice blue accent line
                ),
              ),
              child: const Text(
                "I am a Computer Science student currently exploring the fundamentals of mobile development.\n\n"
                "Born in Manila but was raised in Negros Occidental, I have always been fascinated by how software can solve real-world problems.\n\n"
                "My life is a blend of intense study sessions and making my family proud.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(List<Widget> children) {
    List<Widget> childrenWithDividers = [];

    for (int i = 0; i < children.length; i++) {
      childrenWithDividers.add(children[i]);
      // Add a divider if it's NOT the last item
      if (i < children.length - 1) {
        childrenWithDividers.add(
          const Divider(
            color: Colors.grey, // The color of the line
            thickness: 0.5, // How thick the line is
            indent: 40, // Space on the left (lines up with text)
            endIndent: 10, // Space on the right
          ),
        );
      }
    }

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(children: childrenWithDividers),
    );
  }

  Widget _infoRow(IconData icon, String label, String data) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.indigo, size: 24),
          const SizedBox(width: 15),
          SizedBox(
            width: 85,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          // No arrow here anymore!
          Expanded(
            child: Text(
              data,
              textAlign: TextAlign.left, // Keeps text next to the label
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }
}
