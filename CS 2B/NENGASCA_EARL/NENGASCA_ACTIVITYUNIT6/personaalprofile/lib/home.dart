import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }


 /// Play Sound Functionnnnnnnnnnnnnn
  Future<void> _playSound() async {
    if (_isPlaying) {
      await _audioPlayer.stop();
      setState(() => _isPlaying = false);
    } else {
   setState(() => _isPlaying = true);
      await _audioPlayer.play(AssetSource('hsss.mp3'));
      _audioPlayer.onPlayerComplete.listen((_) {
        if (mounted) setState(() => _isPlaying = false);
      });
    }
  }

  @override
             Widget build(BuildContext context) {




    return Scaffold(
      backgroundColor: const Color(0xFFEAF2E3),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 71, 224, 241),
        title: const Text(
          'My Pet', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),
          ),

    elevation: 4,
        ), 
      
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
     child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
      
        //introductionhs of my pet aand name
            const Text(
              'This is my Pet Snake, Drako! 🐍',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color.fromARGB(255, 0, 0, 0),
              ),
       ),
            const SizedBox(height: 25),
       


       //Container for the piucture of my pet
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(50),
                
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(67),
                child: Image.asset(
                  'assets/pet.jpg',
                  fit: BoxFit.cover,
             errorBuilder: (context, error, stackTrace) {
                    // Fallback if image not found
                    return Container(
                      color: const Color.fromARGB(150, 97, 232, 225),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                    Icon(Icons.pets, size: 80, color: Colors.indigo),
                          SizedBox(height: 12),
                          Text(
                            'Add pet.jpg to\nassets/images/',
                            textAlign: TextAlign.center,
                       style: TextStyle(color: Colors.indigo),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 24),

            // BUTTON TO PLAY HSS SOUND
            SizedBox(
             width: double.infinity,
              height: 74,
              child: ElevatedButton.icon(
                onPressed: _playSound,
        icon: Icon(
              _isPlaying ? Icons.stop_circle_outlined : Icons.volume_up_rounded,
                  size: 28, color: Color.fromARGB(255, 27, 13, 123)
                ),
                label: Text(
                  'Make Drako Hiss',
                  style: const TextStyle(



               fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(150, 97, 232, 225),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80),
                  ), 
                  elevation: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}