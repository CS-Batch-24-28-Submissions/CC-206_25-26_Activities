import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; // this page uses mp3 usage

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Meet Bogart, my pet beagle!',  // a small header to introduce my pet
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/beagle.png', // Bogart's Image
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 20),
              IconButton(
                iconSize: 48,
                icon: const Icon(Icons.volume_up),
                onPressed: () async{
                  final player = AudioPlayer();
                  await player.play(AssetSource('audio/beagle_sound.mp3')); // play this mp3 file onclick
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}