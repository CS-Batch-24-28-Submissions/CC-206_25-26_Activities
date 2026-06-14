import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

// NAVBAR 
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

// MAIN SCREEN
class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  final screens = [
    const PetScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 5,
        title: const Text(
          "Purzuelo - Unit 6 Assignment",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),

      body: screens[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

// PET SCREEN
class PetScreen extends StatelessWidget {
  const PetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // PET IMAGE
            Image.asset(
              "assets/images/dog.jpg",
              height: 450,
            ),

            const SizedBox(height: 30),

            // SOUND BUTTON
            ElevatedButton.icon(
              onPressed: () async {
                await player.play(
                  AssetSource('audio/dog.mp3'),
                );
              },
              icon: const Icon(Icons.volume_up),
              label: const Text("Play Sound"),
            ),
          ],
        ),
      ),
    );
  }
}

// PROFILE SCREEN 
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade50,

      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // PROFILE 
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),

                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                          "assets/images/profile.jpg",
                        ),
                      ),

                      const SizedBox(width: 20),

                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Miguel Vince C. Purzuelo",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "BS Computer Science Student",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 15),
              buildInfoSection(),
              const SizedBox(height: 15),

              // BIOGRAPHY 
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "About Me",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 10),

                      Text(
                        "Hi, My name is Miguel Vince C. Purzuelo. "
                        "I am 20 years old, and a second-year computer science student in West Visayas State University. "
                        "I enjoy playing videogames, reading manga and comics, watching anime, and occasionally cycling during my free time. "
                        "I am slowly working towards getting better at software development hoping to create useful programs that "
                        "can help solve real-world problems and make mine and other people's lives just a little bit more relaxing.",
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// PERSONAL INFO  
Widget buildInfoRow(
  IconData icon,
  String label,
  String value,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      children: [
        Icon(icon),
        const SizedBox(width: 10),
        SizedBox(
          width: 90,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(child: Text(value)),
      ],
    ),
  );
}
Widget buildInfoSection() {
  return Column(
    children: [
      buildInfoRow(Icons.email, "Email Address", "miguel.purzuelo@gmail.com"),
      buildInfoRow(Icons.phone, "Phone Number", "09614311102"),
      buildInfoRow(Icons.school, "Course", "BS in Computer Science"),
      buildInfoRow(Icons.cake, "Birthday", "September 15, 2005"),
      buildInfoRow(Icons.favorite, "Hobbies", "Gaming, Manga, Anime, Comics, Cycling"),
      buildInfoRow(Icons.location_on, "Address", "Florvel Oton, Iloilo"),
    ],
  );
}