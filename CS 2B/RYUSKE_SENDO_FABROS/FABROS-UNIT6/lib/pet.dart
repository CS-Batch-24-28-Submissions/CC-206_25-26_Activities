import 'package:flutter/material.dart';
import 'main.dart';
import 'package:audioplayers/audioplayers.dart';

class PetPage extends StatefulWidget {
  const PetPage({super.key});

  @override
  State<PetPage> createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SkunkColors.black,
      appBar: AppBar(
        backgroundColor: SkunkColors.mediumGray,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'My Pet Skunk',
          style: TextStyle(
            color: SkunkColors.whiteGray,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image Section
              Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: SkunkColors.whiteGray.withOpacity(0.1),
                    width: 6,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 30,
                      offset: const Offset(0, 15),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset('assets/skunk.png', fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 50),
              // Skunk Name/Info
              const Text(
                'Stinky',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: SkunkColors.whiteGray,
                ),
              ),
              const SizedBox(height: 60),
              // Interactive Noise Button
              GestureDetector(
                onTap: () async {
                  //play skunk mp3
                  await _audioPlayer.play(AssetSource('skunk.mp3'));
                  await Future.delayed(const Duration(seconds: 1));
                  //stop after 1s
                  await _audioPlayer.stop();
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: SkunkColors.darkGray,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: SkunkColors.whiteGray.withOpacity(0.1),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.volume_up, color: SkunkColors.whiteGray),
                      SizedBox(width: 12),
                      Text(
                        'Play Skunk Noise',
                        style: TextStyle(
                          color: SkunkColors.whiteGray,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Pet'),
        ],
        backgroundColor: SkunkColors.mediumGray,
        selectedItemColor: SkunkColors.whiteGray,
        unselectedItemColor: SkunkColors.lightGray,
      ),
    );
  }
}
