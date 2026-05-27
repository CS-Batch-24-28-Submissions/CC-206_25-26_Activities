import 'pet_sound_player_stub.dart'
    if (dart.library.html) 'pet_sound_player_web.dart';

Future<void> playDogBark() => playDogBarkImpl();
