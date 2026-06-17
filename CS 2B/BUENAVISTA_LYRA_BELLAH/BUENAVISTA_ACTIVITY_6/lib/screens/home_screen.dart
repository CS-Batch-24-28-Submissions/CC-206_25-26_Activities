import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../theme/styles.dart';
import '../widgets/app_drawer.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _playSound() async {
    final player = AudioPlayer();
    await player.play(AssetSource('audio/meowSound.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: const AppDrawer(currentIndex: 0), // drawer index

      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.navBg,
        elevation: 0,
        titleSpacing: 0,
        leading: Builder(
          builder: (ctx) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(ctx).openDrawer(),
          ),
        ),
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 20,
            fontFamily: 'Poppins',
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
        child: Column(
          children: [
            const SizedBox(height: 120),

            Container(
              width: 190,
              height: 187,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.cardBorder, width: 1.5),
                image: const DecorationImage(
                  image: AssetImage('assets/images/cat.jpg'),
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 30.67),

            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: _playSound,
                icon: const Icon(Icons.volume_up),
                label: const Text(
                  'Play MEOW Sound',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, fontFamily: 'Poppins'),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.navBg,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(12), ),
                  elevation: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}