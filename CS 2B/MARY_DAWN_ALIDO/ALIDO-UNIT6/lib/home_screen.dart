import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    //dispose wudio when screen is closed
    _audioPlayer.dispose();
    super.dispose();
  }

  //to play the audio
  void _playAudio() async {
    await _audioPlayer.play(AssetSource('audio/pibble_sound.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pinkMist50,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('PET PIBBLE HOME',
          style: TextStyle(
            color: AppColors.pinkMist900,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.pinkMist300.withOpacity(0.5),
                    blurRadius: 20,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect( //for rounded corners of the image
                borderRadius: BorderRadius.circular(24),
                child: Image.asset('assets/images/pibble.png', width: 350, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 30),

            const Text(
              'Meet Pibble!',
              style: TextStyle(
                color: AppColors.petal950,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                onPressed: _playAudio,
                icon: const Icon(Icons.play_arrow, color: Colors.white),
                label: const Text('PLAY SOUND',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.3
                ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.sage600,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}