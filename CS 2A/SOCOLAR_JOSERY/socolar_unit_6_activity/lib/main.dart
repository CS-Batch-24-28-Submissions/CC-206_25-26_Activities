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
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

//class with navbar and to enable switching
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // 0 = Home, 1 = Profile

  //pages to switch
  static const List<Widget> _pages = [
    HomeScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], //selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
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

//Home screen Placeholder
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isMeowing = false;
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> _meow() async {
    setState(() => _isMeowing = true);

    await _audioPlayer.play(AssetSource('catSound.mp3'));

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              Text('🐱', style: TextStyle(fontSize: 20)),
              SizedBox(width: 8),
              Text(
                'Meooow!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          backgroundColor: Colors.teal[700],
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    }

    await Future.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _isMeowing = false);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final teal = Theme.of(context).colorScheme.primary;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              //Header home screen
              Container(
                height: 160,
                width: double.infinity,
                color: teal,
                child: const Center(
                  child: Text(
                    'Home Screen',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Cat Photo section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.07),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.pets, color: teal),
                          const SizedBox(width: 8),
                          Text(
                            'My Cat',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // Single cat photo
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/cats.jpg', // cat picture
                          width: double.infinity,
                          height: 600,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 220,
                              decoration: BoxDecoration(
                                color: Colors.teal[50],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.pets, size: 60, color: teal),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Add your cat photo!',
                                    style: TextStyle(color: teal),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              //Meow Button section------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton.icon(
                    onPressed: _isMeowing ? null : _meow,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: teal,
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: Colors.teal[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 3,
                    ),
                    icon: Icon(
                      _isMeowing ? Icons.stop : Icons.play_arrow,
                    ),
                    label: Text(
                      _isMeowing ? 'Meowing...' : 'Press to Meow!',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    const double bannerHeight = 200.0;
    const double avatarRadius = 60.0;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none, 
                children: [
                  Column(
                    children: [
                      Container(
                        height: bannerHeight,
                        width: double.infinity,
                        color: Theme.of(context).colorScheme.primary,
                        child: const Center(
                          child: Text(
                            "Profile Screen", 
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40.0),
                          ),
                        ),
                      ),
                      
                      // details section
                      Container(
                        width: double.infinity,
                        color: Colors.white,
                        padding: const EdgeInsets.only(
                          top: avatarRadius + 45,
                          left: 24,
                          right: 24,
                          bottom: 16,
                        ),
                        child: const ProfileDetails(),
                      ),
                    ],
                  ),

                 Positioned(
                    top: bannerHeight - avatarRadius,
                    left: 24,
                    right: 24,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          radius: avatarRadius,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: avatarRadius - 4,
                            backgroundImage: const AssetImage('assets/my_profile.jpg'),
                          ),
                        ),
                        
                        const SizedBox(width: 13),
                        
                        // 2. Your Name Text
                        const Expanded( 
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 33.0),
                            child: Text(
                              "Josery Hope Socolar",
                              style: TextStyle(
                                fontSize: 22, 
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              
              const SizedBox(height: 8),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: AboutMeSection(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Personal Details",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        
        // Profile details
        _formatInfo(Icons.cake_outlined, "Birthdate", "March 17, 2005"),
        _formatInfo(Icons.home_outlined, "Address", "Jiabo-an, Pavia, Iloilo, Philippines"),
        _formatInfo(Icons.email_outlined, "Email", "joseryhope.socolar@wvsu.edu.ph"),
        _formatInfo(Icons.phone_android_outlined, "Phone Number", "09278168623"),
        _formatInfo(Icons.school_outlined, "Education", "West Visayas State University"),
        _formatInfo(Icons.book_outlined, "Course", "Bachelor of Science in Computer Science"),
        _formatInfo(Icons.favorite_border, "Hobbies", "Reading, Crocheting, Gaming, Drawing, Writing"),
        
        const SizedBox(height: 16),
        const Divider(color: Colors.grey, thickness: 0.5), 
      ],
    );
  }

  
  Widget _formatInfo(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0), 
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          Icon(icon, size: 20, color: Colors.blueGrey[700]),
          const SizedBox(width: 12),
          
          
          SizedBox(
            width: 120, 
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
          
          // 3. Values Section
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "About me:",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "My name is Josery Hope and I live in Jibao-an Pavia, I love animals especially cats, but I also love dogs. I love to play games and read on my free time. I love watching anime as well. I love to travel to places that are surrounded by nature.",
            style: TextStyle(
              fontSize: 13.5,
              height: 1.5, 
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}