import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'profile.dart';

class AssignmentSix extends StatefulWidget {
  const AssignmentSix({super.key});

  @override
  State<AssignmentSix> createState() => _AssignmentSixState();
}

class _AssignmentSixState extends State<AssignmentSix> {
  int _selectedIndex = 0;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playBarkSound() async {
    await _audioPlayer.play(AssetSource('sounds/dog_bark.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCEDC8),
      body: Column(
        children: [
          if (_selectedIndex == 0) _headerAssignment(),
          if (_selectedIndex == 0) const SizedBox(height: 7),
          const SizedBox(height: 7),
          Expanded(
            child: _selectedIndex == 0 ? _bodyAssignment() : const Profile(),
          ),
        ],
      ),
      bottomNavigationBar: _navigationAssignment(),
    );
  }

  Widget _headerAssignment() {
    return Container(
      height: 63,
      decoration: const BoxDecoration(color: Color(0xFF9CCC65)),
      padding: const EdgeInsets.all(10),
      child: const Row(
        children: [
          Text(
            'Hello, My Friend!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _bodyAssignment() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          const Text(
            'Meet my pet Brown and White',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),

          // Photo placeholder
          Center(
            child: Container(
              width: 320,
              height: 260,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade400, width: 1.5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/pictures/pet.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Sound button
          Center(
            child: ElevatedButton.icon(
              onPressed: _playBarkSound,
              icon: const Icon(Icons.volume_up),
              label: const Text(
                'Tap to hear them bark',
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF9CCC65),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navigationAssignment() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      backgroundColor: const Color(0xFF9CCC65),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white60,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
