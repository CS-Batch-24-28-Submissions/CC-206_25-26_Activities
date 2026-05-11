import 'package:flutter/material.dart';
import 'package:flutter_soloud/flutter_soloud.dart';

class FavoriteAnimalPage extends StatefulWidget {
  const FavoriteAnimalPage({super.key});

  @override
  State<FavoriteAnimalPage> createState() => _FavoriteAnimalPageState();
}

class _FavoriteAnimalPageState extends State<FavoriteAnimalPage> {
  AudioSource? _clickSound;

  @override
  void initState() {
    super.initState();
    _loadSound();
  }

  Future<void> _loadSound() async {
    final sound = await SoLoud.instance.loadAsset('assets/sounds/owl_sound.mp3');
    setState(() {
      _clickSound = sound;
    });
  }

  Future<void> _playSound() async {
    if (_clickSound != null) {
      SoLoud.instance.play(_clickSound!);
    }
  }

  @override
  void dispose() {
    if (_clickSound != null) {
      SoLoud.instance.disposeSource(_clickSound!);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        title: Text('The Owl'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 8,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/owl_image.webp',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _clickSound != null ? _playSound : null,
              child: const Icon(Icons.play_arrow),
            ),
          ],
        ),
      ),
    );
  }
}