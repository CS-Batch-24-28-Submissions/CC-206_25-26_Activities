import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.03).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  Future<void> _playPetSound() async {
    if (_isPlaying) {
      await _audioPlayer.stop();
      _pulseController.stop();
      _pulseController.reset();
    } else {
      _pulseController.repeat(reverse: true);
      await _audioPlayer.play(AssetSource('audio/pet_sound.mp3'));
    }
    setState(() => _isPlaying = !_isPlaying);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 140,
                pinned: true,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: const Text(
                    'MY COMPANION',
                    style: TextStyle(letterSpacing: 4, fontWeight: FontWeight.w900, fontSize: 18),
                  ),
                  background: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF2D0000), Color(0xFF0A0A0A)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    ScaleTransition(
                      scale: _pulseAnimation,
                      child: const _PetImageCard(),
                    ),
                    const SizedBox(height: 24),
                    _SoundButtonCard(isPlaying: _isPlaying, onTap: _playPetSound),
                    const SizedBox(height: 24),
                    const _FunFactCard(),
                    const SizedBox(height: 40),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PetImageCard extends StatelessWidget {
  const _PetImageCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 10,
            child: Image.asset(
              'assets/images/pet.jpg',
              fit: BoxFit.cover,
              errorBuilder: (context, _, __) => Container(
                color: Colors.white10,
                child: const Icon(Icons.pets, size: 64, color: Colors.white10),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Barter', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(
                      'German Shepherd x Aspin • 3 Years',
                      style: TextStyle(color: Colors.grey[500], fontSize: 14),
                    ),
                  ],
                ),
                const CircleAvatar(
                  backgroundColor: Color(0xFF2A0000),
                  child: Icon(Icons.favorite, color: Color(0xFFE53935), size: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SoundButtonCard extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onTap;
  const _SoundButtonCard({required this.isPlaying, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: isPlaying
                ? [const Color(0xFFB71C1C), const Color(0xFFE53935)]
                : [const Color(0xFFE53935), const Color(0xFFFF5252)],
          ),
          boxShadow: [
            BoxShadow(
              // FIXED: Replaced deprecated withOpacity with withValues
              color: const Color(0xFFE53935).withValues(alpha: 0.3),
              blurRadius: isPlaying ? 20 : 10,
              offset: const Offset(0, 5),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(isPlaying ? Icons.stop_circle : Icons.play_circle_fill, color: Colors.white, size: 28),
            const SizedBox(width: 12),
            Text(
              isPlaying ? 'STOP SOUND' : 'HEAR BARTER',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FunFactCard extends StatelessWidget {
  const _FunFactCard();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'A SPECIAL STORY',
              style: TextStyle(
                color: Color(0xFFE53935),
                fontSize: 12,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Traded for a set of groceries on a 17th birthday, Barter became a legend. Though he passed away in 2021, the memories we shared will live on through this project.',
              style: TextStyle(color: Colors.grey[400], height: 1.6, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}