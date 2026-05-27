import 'package:flutter/services.dart';

const MethodChannel _petSoundChannel = MethodChannel(
  'activity_6_profile_pet/pet_sound',
);

Future<void> playDogBarkImpl() async {
  try {
    await _petSoundChannel.invokeMethod<void>('playDogBark');
  } on MissingPluginException {
    await SystemSound.play(SystemSoundType.alert);
  }
}
