// ignore_for_file: avoid_web_libraries_in_flutter, deprecated_member_use

import 'dart:html' as html;

html.AudioElement? _dogBarkAudio;

Future<void> playDogBarkImpl() async {
  final html.AudioElement audio = _dogBarkAudio ??= html.AudioElement(
    'assets/assets/audio/dog_bark.wav',
  )..preload = 'auto';

  audio.currentTime = 0;
  await audio.play();
}
