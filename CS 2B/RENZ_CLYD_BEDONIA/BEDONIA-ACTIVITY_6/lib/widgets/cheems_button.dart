import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:simpe_flutter_application/style/theme.dart';

class SoundButton extends StatelessWidget {
  const SoundButton({super.key});

  @override
  Widget build(BuildContext context) {
    // Pet Sound Button
    return ElevatedButton.icon(
      icon: const Icon(Icons.volume_up, color: Colors.white),
      label: Text(
        'Hear Cheem\'s Bark',
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        minimumSize: const Size(double.infinity, 48),
        backgroundColor: AppTheme.appGreen,
      ),
      onPressed: () async {
        final player = AudioPlayer();
        await player.play(AssetSource('audio/pet_sound.mp3'));
      },
    );
  }
}
