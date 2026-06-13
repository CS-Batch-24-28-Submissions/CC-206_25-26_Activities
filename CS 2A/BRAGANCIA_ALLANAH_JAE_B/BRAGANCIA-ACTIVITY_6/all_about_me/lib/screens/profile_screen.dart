import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/glass_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final List<Animation<double>> _fadeInAnimations;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );
    _fadeInAnimations = [
      CurvedAnimation(
        parent: _fadeController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
      ),
      CurvedAnimation(
        parent: _fadeController,
        curve: const Interval(0.25, 1.0, curve: Curves.easeOut),
      ),
    ];
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Stack(
        children: [
          _buildBackground(),
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 120),
            child: Column(
              children: [
                _buildTopHeader(),
                _buildHeader(context),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      _buildInfoSection(),
                      const SizedBox(height: 24),
                      _buildBiographySection(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 30, bottom: 30, left: 24, right: 24),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A).withValues(alpha: 0.8),
        border: const Border(
          bottom: BorderSide(
            color: Color.fromARGB(31, 255, 255, 255),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(
                255,
                255,
                255,
                255,
              ).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color.fromARGB(26, 255, 255, 255),
              ),
            ),
            child: const Icon(
              Icons.person_rounded,
              color: Color.fromARGB(255, 255, 255, 255),
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            'A LITTLE ABOUT ALLANAH',
            style: GoogleFonts.outfit(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 255, 255, 255),
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        // Curved Header with Gradient
        Container(
          height: 185,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 99, 102, 241),
                Color.fromARGB(255, 139, 92, 246),
                Color.fromARGB(255, 236, 72, 153),
              ],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(60),
              bottomRight: Radius.circular(60),
            ),
          ),
        ),
        // Positioned Profile Info (Side-by-Side)
        Positioned(
          bottom: 30,
          left: 24,
          right: 24,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 60,
                  backgroundColor: Color(0xFFF1F5F9),
                  backgroundImage: AssetImage('assets/images/profile.JPG'),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Allanah Jae Bragancia',
                      style: GoogleFonts.outfit(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        shadows: [
                          const Shadow(
                            color: Color.fromARGB(66, 10, 10, 10),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white30),
                      ),
                      child: Text(
                        'Nice to meet you!',
                        style: GoogleFonts.outfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBiographySection() {
    return FadeTransition(
      opacity: _fadeInAnimations[1],
      child: GlassCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Biography',
              style: GoogleFonts.outfit(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Hi! I am Allanah Jae B. Bragancia but you can call me Yana, a 2nd year BS Computer Science student at West Visayas State University,'
              ' with a dream of becoming a Full Stack Developer. I’ve always been driven by the belief that '
              '“the journey may be tough, so are you,” which keeps me focused and motivated through both my studies and life’s challenges. '
              'During my elementary and high school days, I was an Arnis player, and that experience taught me discipline,'
              'focus, and perseverance. Outside of classes, I enjoy listening to music, having movie nights with '
              'my family, and caring for my dog, Goli. Sleep is important to me, but I make sure to dedicate as '
              'much time as possible to learning and improving my programming skills, knowing that constant '
              'practice is essential for my future career. I find peace in nature, especially at the beach or '
              'in the province, where I can reconnect and clear my mind. With my family and a strong group of '
              'friends by my side, I’m constantly inspired to grow and move forward, always striving for balance '
              'between my ambitions and the simple joys of life.',
              style: GoogleFonts.outfit(
                fontSize: 16,
                height: 1.6,
                color: Colors.white.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection() {
    return FadeTransition(
      opacity: _fadeInAnimations[0],
      child: GlassCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Get to know me!',
              style: GoogleFonts.outfit(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            _buildInfoRow(
              Icons.face_rounded,
              'Nickname',
              'Yana',
              const Color.fromARGB(255, 139, 92, 246),
            ),
            _buildDivider(),
            _buildInfoRow(
              Icons.cake_rounded,
              'Birthday',
              'February 15, 2006',
              const Color.fromARGB(255, 245, 158, 11),
            ),
            _buildDivider(),
            _buildInfoRow(
              Icons.location_on_rounded,
              'Address',
              'Tubungan, Barotac Nuevo, Iloilo',
              const Color.fromARGB(255, 16, 185, 129),
            ),
            _buildDivider(),
            _buildInfoRow(
              Icons.phone_rounded,
              'Phone',
              '+63 951 953 7018',
              const Color.fromARGB(255, 245, 158, 11),
            ),
            _buildDivider(),
            _buildInfoRow(
              Icons.email_rounded,
              'Email',
              'yanna.bragancia@email.com',
              const Color.fromARGB(255, 236, 72, 153),
            ),
            _buildDivider(),
            _buildInfoRow(
              Icons.school_rounded,
              'Course',
              'BS Computer Science',
              const Color.fromARGB(255, 99, 102, 241),
            ),
            _buildDivider(),
            _buildInfoRow(
              Icons.favorite_rounded,
              'Hobbies',
              'Studying, Sleeping, Practice Coding, Listening to Music, Watching Movies, Playing Arnis',
              const Color.fromARGB(255, 236, 72, 153),
            ),
            _buildDivider(),
            _buildInfoRow(
              Icons.music_note_rounded,
              'Favorite Song',
              'Best Part by Daniel Caesar',
              const Color.fromARGB(255, 6, 182, 212),
            ),
            _buildDivider(),
            _buildInfoRow(
              Icons.movie_rounded,
              'Favorite Movie',
              'The Art of Racing in the Rain',
              const Color.fromARGB(255, 244, 63, 94),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Divider(color: Colors.white.withValues(alpha: 0.1), height: 1),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String data, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 22),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: GoogleFonts.outfit(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            data,
            style: GoogleFonts.outfit(fontSize: 16, color: Colors.white70),
          ),
        ),
      ],
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0F172A), Color(0xFF1E293B), Color(0xFF0F172A)],
        ),
      ),
    );
  }
}
