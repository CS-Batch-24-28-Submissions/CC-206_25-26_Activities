import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/glass_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isHovering = false;
  bool _isPressed = false;

  void _playSound() async {
    await _audioPlayer.play(AssetSource('audio/goli.mp3'));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Stack(
        children: [
          _buildBackground(),
          SafeArea(
            child: Column(
              children: [
                _buildHeader(),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 900) {
                        return _buildDesktopLayout(constraints);
                      } else {
                        return _buildMobileLayout(constraints);
                      }
                    },
                  ),
                ),
                const SizedBox(height: 100), // Space for bottom nav
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BoxConstraints constraints) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left Side: Pet Image
          Expanded(
            flex: 5,
            child: _buildStaticPetImage(isDesktop: true),
          ),
          const SizedBox(width: 60),
          // Right Side: Info Card
          Expanded(
            flex: 4,
            child: _buildPetInfoCard(isDesktop: true),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BoxConstraints constraints) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        children: [
          _buildStaticPetImage(isDesktop: false),
          const SizedBox(height: 32),
          _buildPetInfoCard(isDesktop: false),
        ],
      ),
    );
  }

  Widget _buildStaticPetImage({required bool isDesktop}) {
    return Container(
      height: isDesktop ? 550 : 450,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Image.asset(
          'assets/images/goli.JPG',
          fit: BoxFit.cover,
          alignment: const Alignment(0, -0.3),
          width: double.infinity,
        ),
      ),
    );
  }

  Widget _buildPetInfoCard({required bool isDesktop}) {
    return GlassCard(
      borderRadius: 32,
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Goliath',
                      style: GoogleFonts.outfit(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'My Bestfriend and Loyal Companion',
                      style: GoogleFonts.outfit(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF6366F1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.pets_rounded, color: Colors.white, size: 28),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Text(
            'About Goli',
            style: GoogleFonts.outfit(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Goli, my Miniature Pinscher, is full of energy and joy. '
            'Always on the move, he brings fun to my days, whether he’s '
            'chasing a ball or relaxing by my side. His playful and '
            'loving nature makes him the perfect companion, filling our '
            'home with happiness.',
            style: GoogleFonts.outfit(
              fontSize: 16,
              height: 1.6,
              color: Colors.white.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 40),
          _buildPlayButton(),
        ],
      ),
    );
  }

  Widget _buildPlayButton() {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: _playSound,
        child: AnimatedScale(
          scale: _isPressed ? 0.95 : (_isHovering ? 1.05 : 1.0),
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeInOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 99, 102, 241),
                  _isHovering ? const Color.fromARGB(255, 165, 180, 252) : const Color.fromARGB(255, 139, 92, 246),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF6366F1).withValues(
                    alpha: _isHovering ? 0.6 : 0.4,
                  ),
                  blurRadius: _isHovering ? 30 : 20,
                  offset: Offset(0, _isHovering ? 12 : 8),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.volume_up_rounded, color: Colors.white, size: 24),
                const SizedBox(width: 12),
                Text(
                  'Listen to Goli',
                  style: GoogleFonts.outfit(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0F172A),
            Color(0xFF1E293B),
            Color(0xFF0F172A),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Row(
        children: [
          GlassCard(
            padding: const EdgeInsets.all(12),
            borderRadius: 16,
            blur: 10,
            child: const Icon(Icons.home_rounded, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Meet My Pet',
                  style: GoogleFonts.outfit(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: -0.5,
                  ),
                ),
                Text(
                  'Say hello to Goli!',
                  style: GoogleFonts.outfit(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
