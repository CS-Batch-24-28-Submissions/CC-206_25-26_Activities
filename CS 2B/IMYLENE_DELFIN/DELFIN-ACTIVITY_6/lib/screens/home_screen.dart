import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart' show AudioPlayer, AssetSource, PlayerState;

const kPrimary    = Color(0xFF6B4F72);
const kAccent     = Color(0xFFD5B0F3);
const kLilac      = Color(0xFFC8B2D6);
const kEarth      = Color(0xFFA0785A);
const kEarthLight = Color(0xFFEDE0D4);
const kBg         = Color(0xFFF7F0FB);
const kText       = Color(0xFF3B2A40);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  late AnimationController _bounceController;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _bounceController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _bounceAnimation = Tween<double>(begin: 1.0, end: 0.93).animate(
      CurvedAnimation(parent: _bounceController, curve: Curves.easeInOut),
    );
    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() => _isPlaying = state == PlayerState.playing);
      }
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _bounceController.dispose();
    super.dispose();
  }

  Future<void> _playPetSound() async {
    _bounceController.forward().then((_) => _bounceController.reverse());
    if (_isPlaying) {
      await _audioPlayer.stop();
    } else {
      await _audioPlayer.play(AssetSource('audio/pet_sound.mp3'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      appBar: AppBar(
        title: const Text(
          'My Pet',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
        backgroundColor: kPrimary,
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // ── Component A: Pet Image ──────────────────────────
              Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 340),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: kAccent.withOpacity(0.25),
                      blurRadius: 20,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: Image.asset(
                          'assets/images/pet.webp',
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            color: kEarthLight,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.pets, size: 80,
                                    color: kEarth.withOpacity(0.5)),
                                const SizedBox(height: 12),
                                const Text(
                                  'Add pet.jpg to\nassets/images/',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: kEarth, fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 20),
                        color: kPrimary,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.favorite, color: kAccent, size: 16),
                            SizedBox(width: 8),
                            Text(
                              'My Beloved Pet',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // ── Component B: Sound Button ───────────────────────
              AnimatedBuilder(
                animation: _bounceAnimation,
                builder: (context, child) =>
                    Transform.scale(scale: _bounceAnimation.value, child: child),
                child: GestureDetector(
                  onTap: _playPetSound,
                  child: Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(maxWidth: 340),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [kPrimary, Color(0xFF9B6FBB)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: kPrimary.withOpacity(0.4),
                          blurRadius: 14,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: Icon(
                            _isPlaying
                                ? Icons.stop_circle_outlined
                                : Icons.volume_up_rounded,
                            key: ValueKey(_isPlaying),
                            color: Colors.white,
                            size: 26,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          _isPlaying ? 'Stop Sound' : 'Play Pet Sound 🔊',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 14),

              // Playing indicator
              AnimatedOpacity(
                opacity: _isPlaying ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: kAccent.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.music_note, size: 14, color: kPrimary),
                      SizedBox(width: 6),
                      Text(
                        'Playing pet sound...',
                        style: TextStyle(
                          fontSize: 13,
                          color: kPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
