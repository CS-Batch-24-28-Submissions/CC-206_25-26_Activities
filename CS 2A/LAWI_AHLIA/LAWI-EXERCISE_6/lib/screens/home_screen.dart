import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

// home screen widget
// displays pet profile with image and audio playback
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {

  // state: tracks if audio is playing
  bool _isPlaying = false;

  // state: tracks button press animation
  bool _isPressed = false;

  // animation controller for image bounce effect
  late AnimationController _bounceCtrl;
  late Animation<double> _bounceAnim;

  // audio player for mp3 playback
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();

    // initialize bounce animation
    _bounceCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _bounceAnim = Tween<double>(begin: 1.0, end: 1.04).animate(
      CurvedAnimation(parent: _bounceCtrl, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    // dispose controllers
    _bounceCtrl.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  // play or stop audio
  void _playSound() async {
    if (_isPlaying) {
      // stop audio
      await _audioPlayer.stop();
      setState(() => _isPlaying = false);
    } else {
      // play bounce animation
      _bounceCtrl.forward(from: 0);

      setState(() => _isPlaying = true);

      // play mp3 asset
      await _audioPlayer.play(
        AssetSource('audio/kitcat.mp3'),
      );

      // reset state when audio finishes
      _audioPlayer.onPlayerComplete.listen((event) {
        if (mounted) {
          setState(() => _isPlaying = false);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final photoHeight = size.height * 0.42;

    return Scaffold(
      // background color
      backgroundColor: const Color(0xFFF5F0E8),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              // header
              Container(
                color: const Color(0xFF1A1A1A),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: const Row(
                  children: [
                    Text(
                      'PET PROFILE',
                      style: TextStyle(color: Color(0xFFF5F0E8)),
                    ),
                  ],
                ),
              ),

              // image section
              Padding(
                padding: const EdgeInsets.all(16),
                child: AnimatedBuilder(
                  animation: _bounceAnim,
                  builder: (ctx, child) => Transform.scale(
                    scale: _bounceAnim.value,
                    child: child,
                  ),
                  child: Container(
                    height: photoHeight,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          'assets/images/pet.jpg',
                          fit: BoxFit.cover,
                        ),

                        // label overlay
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            color: Colors.black.withOpacity(0.6),
                            padding: const EdgeInsets.all(10),
                            child: const Text(
                              'KITCAT - DOMESTIC CAT',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // audio button
              Padding(
                padding: const EdgeInsets.all(16),
                child: GestureDetector(
                  onTapDown: (_) => setState(() => _isPressed = true),
                  onTapUp: (_) => setState(() => _isPressed = false),
                  onTapCancel: () => setState(() => _isPressed = false),
                  onTap: _playSound,

                  child: AnimatedScale(
                    scale: _isPressed ? 0.97 : 1.0,
                    duration: const Duration(milliseconds: 80),

                    child: Container(
                      padding: const EdgeInsets.all(16),
                      color: _isPlaying ? Colors.red : const Color(0xFF1A1A1A),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            _isPlaying ? Icons.stop : Icons.graphic_eq,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            _isPlaying ? 'STOP PLAYBACK' : 'PLAY VOCALIZATION',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}