import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

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
    AudioPlayer.global.setAudioContext(AudioContext()); // add this
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _audioPlayer.onPlayerComplete.listen((_) {
      if (mounted) {
        setState(() => _isPlaying = false);
        _waveController.stop();
      }
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
    _waveController.repeat(reverse: true);
    await _audioPlayer.play(AssetSource('audio/sound.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F7FA),
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildPetCard(),
              const SizedBox(height: 20),
              _buildSoundButton(),
              if (_isPlaying) ...[
                const SizedBox(height: 16),
                _buildPlayingIndicator(),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // ── Pet image card ───────────────────────────────────────────────────────
  Widget _buildPetCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/emerald.jpg',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F4FF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.pets,
                  size: 80,
                  color: Color(0xFF4A90D9),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Emerald',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1D23),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'My childhood dog since I was 1st grade. She was a very good dog and I miss her a lot.',
            style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
          ),
        ],
      ),
    );
  }

  // ── Play sound button ────────────────────────────────────────────────────
  Widget _buildSoundButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: _isPlaying ? null : _playSound,
        icon: Icon(
          _isPlaying ? Icons.volume_up : Icons.play_circle_fill,
          size: 22,
        ),
        label: Text(
          _isPlaying ? 'Playing...' : 'Play Dog Sound',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4A90D9),
          foregroundColor: Colors.white,
          disabledBackgroundColor: const Color(0xFF93C0EB),
          disabledForegroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 0,
        ),
      ),
    );
  }

  // ── Animated playing indicator ───────────────────────────────────────────
  Widget _buildPlayingIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFEBF4FF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
            animation: _waveController,
            builder: (_, __) {
              final heights = [8.0, 14.0, 10.0, 16.0, 8.0];
              return Row(
                children: List.generate(5, (i) {
                  final animated = heights[i] *
                      (0.5 +
                          0.5 *
                              (_waveController.value *
                                      (i % 2 == 0 ? 1 : -1) +
                                  1)
                                  .clamp(0.0, 1.0));
                  return Container(
                    width: 3,
                    height: animated,
                    margin: const EdgeInsets.symmetric(horizontal: 1.5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4A90D9),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  );
                }),
              );
            },
          ),
          const SizedBox(width: 10),
          const Text(
            'Playing dog sound...',
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF4A90D9),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
