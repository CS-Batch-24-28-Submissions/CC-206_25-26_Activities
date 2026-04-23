import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Gem Adrian C. Candaganan'),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),

        body: currentIndex == 0 ? ProfilePage() : HomePage(),

        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          ],

          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/ProfilePic.jpeg"),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gem Adrian C. Candaganan",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("BSCS 2B AI"),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Card(
                  child: ListTile(
                    leading: Icon(Icons.email),
                    title: Text("Email"),
                    subtitle: Text("gem.candaganan@wvsu.edu.ph"),
                  ),
                ),

                Card(
                  child: ListTile(
                    leading: Icon(Icons.phone),
                    title: Text("Phone"),
                    subtitle: Text("09953900466"),
                  ),
                ),

                Card(
                  child: ListTile(
                    leading: Icon(Icons.location_city),
                    title: Text("Address"),
                    subtitle: Text(
                      "Jalandoni Street, Iloilo City, Philippines",
                    ),
                  ),
                ),

                Card(
                  child: ListTile(
                    leading: Icon(Icons.cake),
                    title: Text("Birthday"),
                    subtitle: Text("February 27, 2006"),
                  ),
                ),

                Card(
                  child: ListTile(
                    leading: Icon(Icons.computer),
                    title: Text("Tech Background"),
                    subtitle: Text(
                      "C++, Java, JavaScript, HTML, CSS, Flutter, React",
                    ),
                  ),
                ),

                Card(
                  child: ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text("Favorite Leisure Activities"),
                    subtitle: Text("Partying, Traveling, Reading"),
                  ),
                ),

                Card(
                  child: ListTile(
                    title: Text(
                      "About Gem",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "I am a 2nd Year Computer Science Student at West Visayas State University College of ICT. Concurrently, I am also serving as the Secretary of the CICT Student Council. I was always facinated by the world of computer and sciences that I have made a committment to dedicate my leadership into ensuring everyone's access to technology.",
                    ),
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AudioPlayer _player = AudioPlayer();

  Future<void> _playSound() async {
    await _player.play(AssetSource("catSound.mp3"));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: [
            Text(
              "MY CAT",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),

            SizedBox(height: 10),

            Image.asset("assets/cat.jpg", height: 400),

            SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                _playSound();
              },
              child: const Text("Play Sound"),
            ),
          ],
        ),
      ),
    );
  }
}
