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
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.93).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _audioPlayer.onPlayerComplete.listen((_) {
      if (mounted) setState(() => _isPlaying = false);
    });
  }

  Future<void> _playBark() async {
    if (_isPlaying) return;
    setState(() => _isPlaying = true);
    _animationController.forward().then((_) => _animationController.reverse());

    try {
      await _audioPlayer.play(AssetSource('audio/bark.wav'));
    } catch (e) {
      // If audio file not found, simulate playback
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) setState(() => _isPlaying = false);
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text(
          'My Pet',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Pet Image Card
              Expanded(
                flex: 3,
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    width: double.infinity,
                    color: const Color(0xFF1E1E1E),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
SizedBox(
                          width: 180,
                          height: 180,
                          child: Image.asset(
                            'assets/images/pet.jpg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Totoy',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFB71C1C),
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'My Adorable Totoy 🐶',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // Sound Button
              Expanded(
                flex: 1,
                child: Center(
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: GestureDetector(
                      onTap: _playBark,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: double.infinity,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: _isPlaying
                                ? [
                                    const Color(0xFFD32F2F),
                                    const Color(0xFFB71C1C),
                                  ]
                                : [
                                    const Color(0xFFB71C1C),
                                    const Color(0xFF7F0000),
                                  ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFB71C1C).withOpacity(0.4),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              child: _isPlaying
                                  ? const SizedBox(
                                      key: ValueKey('loading'),
                                      width: 28,
                                      height: 28,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2.5,
                                      ),
                                    )
                                  : const Icon(
                                      key: ValueKey('icon'),
                                      Icons.volume_up_rounded,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                            ),
                            const SizedBox(width: 14),
                            Text(
                              _isPlaying ? 'Woof! Woof! 🐾' : 'Play Bark Sound 🐾',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}