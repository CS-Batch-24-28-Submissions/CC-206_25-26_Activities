import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  late AnimationController _waveController;

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true);

    _audioPlayer.onPlayerComplete.listen((_) {
      if (mounted) setState(() => _isPlaying = false);
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _waveController.dispose();
    super.dispose();
  }

  Future<void> _playSound() async {
    if (_isPlaying) return;
    setState(() => _isPlaying = true);
    try {
      // Place your audio file at: assets/audio/meow.mp3
      await _audioPlayer.play(AssetSource('audio/meow.mp3'));
    } catch (e) {
      // If asset not found, stop animation
      setState(() => _isPlaying = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Add meow.mp3 to assets/audio/ to enable sound.'),
            backgroundColor: AppTheme.primaryDark,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Meet my pet!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primaryDark,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Say hello to Luna 🐱',
                style: TextStyle(
                  fontSize: 14,
                  color: AppTheme.primary.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 20),

              // Pet card
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppTheme.border, width: 0.8),
                ),
                child: Column(
                  children: [
                    // Pet image
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      child: Container(
                        height: 260,
                        width: double.infinity,
                        color: AppTheme.primarySurface,
                        child: Image.asset(
                          'assets/images/pet.jpg',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.pets_rounded,
                                  size: 80,
                                  color: AppTheme.primaryLight,
                                ),
                                SizedBox(height: 12),
                                Text(
                                  'Add pet.jpg to\nassets/images/',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppTheme.primaryDark,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Pet info row
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Luna',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.textDark,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'Domestic Shorthair · 2 years old',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppTheme.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.favorite_rounded,
                            color: AppTheme.primary.withOpacity(0.7),
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Sound button
              GestureDetector(
                onTap: _playSound,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: _isPlaying ? AppTheme.primaryDark : AppTheme.primary,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primary.withOpacity(0.35),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (_isPlaying) ...[
                        _WaveIndicator(controller: _waveController),
                        const SizedBox(width: 10),
                        const Text(
                          'Playing...',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ] else ...[
                        const Icon(
                          Icons.volume_up_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Play Mochi's Meow",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),
              const Center(
                child: Text(
                  'Audio: assets/audio/meow.mp3',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppTheme.textHint,
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

class _WaveIndicator extends StatelessWidget {
  final AnimationController controller;
  const _WaveIndicator({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(4, (i) {
        return AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            final double offset = (i * 0.25);
            final double t = (controller.value + offset) % 1.0;
            final double height = 4 + (t * 12);
            return Container(
              width: 3,
              height: height,
              margin: const EdgeInsets.symmetric(horizontal: 1.5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
            );
          },
        );
      }),
    );
  }
}
