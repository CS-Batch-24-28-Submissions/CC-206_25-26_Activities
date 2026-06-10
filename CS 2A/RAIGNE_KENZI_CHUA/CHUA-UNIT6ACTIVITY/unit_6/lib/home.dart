import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: AspectRatio(
                    aspectRatio: 9 / 16,
                    child: Image.asset(
                      'assets/images/pet.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton.icon(
              onPressed: () {
                playPetSound();
              },
              icon: const Icon(Icons.volume_up),
              label: const Text('Play Pet Sound'),
            ),
          ),
        ],
      ),
    );
  }
}

final _player = AudioPlayer();

void playPetSound() async {
  await _player.stop();
  await _player.play(AssetSource('audio/pet_sound.mp3'));
}