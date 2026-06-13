import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile App',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentIndex == 0 ? HomeScreen() : ProfileScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AudioPlayer audioPlayer = AudioPlayer();

  void playSound() async {
    await audioPlayer.play(AssetSource('audio/kewpie_sound.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/kewpie_photo_1.jpg',
              height: 300,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: playSound,
              child: Text('Play Sound'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      appBar: AppBar(
        title: Text('Ralph Anthony Colada'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
                SizedBox(width: 16),
                Text(
                  'Ralph Anthony Colada',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.email),
                      SizedBox(width: 8),
                      Text('Email: ', style: TextStyle(fontWeight: FontWeight.bold)),
                      Expanded(child: Text('ralphanthony.colada@wvsu.edu.ph')),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Icon(Icons.cake),
                      SizedBox(width: 8),
                      Text('Birthday: ', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('October 24, 2004'),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Icon(Icons.school),
                      SizedBox(width: 8),
                      Text('Course: ', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('BS Computer Science'),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 8),
                      Text('Hometown: ', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Buyu-an, Tigbauan, Iloilo'),
                    ],
                  ),
                  Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.interests),
                      SizedBox(width: 8),
                      Text('Hobbies: ', style: TextStyle(fontWeight: FontWeight.bold)),
                      Expanded(
                        child: Text(
                          'Video Editing, 3D Modeling, Photography, Videography, Baking, Gymming, Bedroom Producing, Digital Designing',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Biography',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Growing up with a curiosity for both technology and creativity, I found my path somewhere in between. I\'m Ralph, a second-year Computer Science student at West Visayas State University, and while code is my toolkit, creativity is my compass. It shapes what I build, how I build it, and why it matters. Outside of academics, I wear many hats as a video editor, 3D modeler, photographer, videographer, bedroom producer, digital designer, baker, and gym-goer. Editing is where my heart lives the most, where storytelling meets craft. I aspire to grow into a Blockchain Developer or Cloud Architect, but whatever path I take, I want the work I put into this world to be as meaningful as it is functional.',
                    style: TextStyle(fontSize: 14, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
