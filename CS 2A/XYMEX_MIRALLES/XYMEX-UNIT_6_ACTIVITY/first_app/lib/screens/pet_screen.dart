import 'package:flutter/material.dart';
import '../decorations.dart';
import 'package:audioplayers/audioplayers.dart';

//PET SCREEN
class PetScreen extends StatefulWidget {
  const PetScreen({super.key});

  @override
  State<PetScreen> createState() => _PetScreenState();
}

class _PetScreenState extends State<PetScreen> {
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 4, right: 4),
          child: Container(
            padding: EdgeInsets.only(top: 70, bottom: 10, left: 20, right: 10),
            width: double.infinity,
            decoration: monitorScreenDec,
            child: Column(
              children: [
                Flexible(
                  flex: 6,
                  child: Padding(
                    padding: EdgeInsets.only(top: 1, bottom: 1),
                    child: Container(
                      decoration: BoxDecoration(
                        border: BoxBorder.all(color: Colors.white, width: 2),
                      ),
                      child: Image.asset('assets/images/kitty.jpg'),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CRTText("My Pet", 15),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(Icons.play_arrow, color: Colors.white),
                    onPressed: () async {
                      if (player.state != PlayerState.playing) {
                        await player.play(AssetSource('audio/meow.mp3'));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
