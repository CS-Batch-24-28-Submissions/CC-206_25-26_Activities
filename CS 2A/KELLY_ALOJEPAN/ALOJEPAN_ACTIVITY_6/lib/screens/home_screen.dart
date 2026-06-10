import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';

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
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _bounceAnimation = Tween<double>(begin: 0, end: 12).animate(
      CurvedAnimation(
        parent: _bounceController,
        curve: Curves.elasticInOut,
      ),
    );

    _audioPlayer.onPlayerComplete.listen((_) {
      setState(() => _isPlaying = false);
      _bounceController.stop();
      _bounceController.reset();
    });
  }

  Future<void> _playSound() async {
    if (_isPlaying) {
      await _audioPlayer.stop();
      setState(() => _isPlaying = false);
      _bounceController.stop();
      _bounceController.reset();
    } else {
      await _audioPlayer.play(
        AssetSource('audio/dog-barking.mp3'),
      );
      setState(() => _isPlaying = true);
      _bounceController.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _bounceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6EE),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),

                  // Tag
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6B4226).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: const Color(0xFF6B4226).withOpacity(0.2),
                      ),
                    ),
                    child: Text(
                      '🐶  Meet My Dog',
                      style: GoogleFonts.dmSans(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF6B4226),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Dog image
                  AnimatedBuilder(
                    animation: _bounceAnimation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, -_bounceAnimation.value),
                        child: child,
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      constraints: const BoxConstraints(maxHeight: 370),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF6B4226).withOpacity(0.25),
                            blurRadius: 35,
                            offset: const Offset(0, 14),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: Image.asset(
                          'assets/images/dog.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Name
                  Text(
                    'Buddy',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cormorantGaramond(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF3D2010),
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    'Beagle · Always happy 🐾',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                      fontSize: 14,
                      color: const Color(0xFF6B4226).withOpacity(0.7),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Button
                  GestureDetector(
                    onTap: _playSound,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: _isPlaying
                              ? [
                                  const Color(0xFFB03A2E),
                                  const Color(0xFF922B21)
                                ]
                              : [
                                  const Color(0xFF6B4226),
                                  const Color(0xFF8B5A2B)
                                ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF6B4226).withOpacity(0.45),
                            blurRadius: 22,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            _isPlaying
                                ? Icons.stop_rounded
                                : Icons.spatial_audio_off_rounded,
                            color: Colors.white,
                            size: 26,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            _isPlaying
                                ? 'Stop Barking'
                                : '🔊  Play Bark Sound',
                            style: GoogleFonts.dmSans(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  if (_isPlaying)
                    Text(
                      '🎵 Woof woof!',
                      style: GoogleFonts.dmSans(
                        color: const Color(0xFFB03A2E),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}