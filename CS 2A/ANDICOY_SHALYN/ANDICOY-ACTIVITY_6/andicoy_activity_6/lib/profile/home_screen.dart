import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:andicoy_activity_6/profile/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AudioPlayer player = AudioPlayer();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: false,
        backgroundColor: Colors.teal,
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/pet.jpg',
              width: 400,
              height: 400,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () async {
                await player.play(AssetSource('images/pet_sound.mp3'));
              },
              icon: const Icon(Icons.volume_up),
              label: const Text('Purrrr'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                textStyle: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}