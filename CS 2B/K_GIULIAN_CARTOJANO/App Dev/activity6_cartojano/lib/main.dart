import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MainLayout()));

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});
  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _index = 0;
  final _pages = [const ProfileScreen(), const PetScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('K Giulian C. Cartojano'), backgroundColor: Colors.blueAccent),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Home'),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.override});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          const CircleAvatar(
            radius: 50, 
            backgroundImage: AssetImage('assets/Literally my FB Profile picture.jpg')
          ),
          const SizedBox(width: 20),
          const Expanded(
            child: Text('K Giulian C. Cartojano', 
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
        ]),
        const SizedBox(height: 30),
        _info(Icons.email, 'EMAIL', 'kgiulian.cartojano@wvsu.edu.ph'),
        _info(Icons.cake, 'BIRTHDAY', 'August 04, 2005'),
        _info(Icons.school, 'COURSE', 'BS Computer Science'),
        _info(Icons.location_on, 'ADDRESS', 'Bgy. Poblacion, Leon, Iloilo'),
        _info(Icons.star, 'HOBBIES', 'Reading Novels, Gaming'),
        const SizedBox(height: 30),
        const Text('My Biography', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        const Text(
          'I am a proud second year student that is a BSCS of CICT at West Visayas State University. '
          'I like reading novels, gaming, and exploring tactical mechanics in games. '
          'I focus on mastering software development and solving complex logic problems through code.', 
          textAlign: TextAlign.justify
        ),
      ]),
    );
  }

  Widget _info(IconData i, String l, String d) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(children: [
      Icon(i, color: Colors.blueAccent), 
      const SizedBox(width: 15), 
      Text('$l: ', style: const TextStyle(fontWeight: FontWeight.bold)), 
      Expanded(child: Text(d))
    ]),
  );
}

class PetScreen extends StatelessWidget {
  const PetScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20), 
          child: Image.asset('assets/Chopper.jpeg', width: 300)
        ),
        const SizedBox(height: 30),
        ElevatedButton.icon(
          onPressed: () => print('Playing sound: Chopper angy bark.mp3'),
          icon: const Icon(Icons.volume_up),
          label: const Text('Play Pet Sound'),
        ),
      ]),
    );
  }
}