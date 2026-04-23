import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6F2),
      body: CustomScrollView(
        slivers: [
          // --- APP BAR ---
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            backgroundColor: const Color(0xFF2C3E50),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Background gradient
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF2C3E50), Color(0xFF4A6274)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  // Subtle pattern overlay
                  Opacity(
                    opacity: 0.05,
                    child: Image.asset(
                      'assets/images/profile.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Profile info
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 60, 24, 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Profile picture
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 15,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: const CircleAvatar(
                            radius: 46,
                            backgroundImage: AssetImage('assets/images/profile.jpg'),
                          ),
                        ),
                        const SizedBox(width: 18),
                        // Name & subtitle
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Arvin',
                                style: GoogleFonts.playfairDisplay(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 3),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  'CS Student · WVSU',
                                  style: GoogleFonts.nunito(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
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
              ),
            ),
          ),

          // --- BODY ---
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),

                  // Section title
                  _sectionTitle('Get to Know Me'),
                  const SizedBox(height: 14),

                  // Info Cards
                  _infoCard(
                    icon: Icons.cake_outlined,
                    label: 'Birthday',
                    value: 'January 1, 2005',
                    color: const Color(0xFF3498DB),
                  ),
                  _infoCard(
                    icon: Icons.location_on_outlined,
                    label: 'Address',
                    value: 'Bitoon Iloilo City, Philippines',
                    color: const Color(0xFF27AE60),
                  ),
                  _infoCard(
                    icon: Icons.email_outlined,
                    label: 'Email',
                    value: 'arvin.bearneza@wvsu.edu.ph',
                    color: const Color(0xFFE74C3C),
                  ),
                  _infoCard(
                    icon: Icons.school_outlined,
                    label: 'Course',
                    value: 'Bachelor of Science in Computer Science',
                    color: const Color(0xFF9B59B6),
                  ),
                  _infoCard(
                    icon: Icons.favorite_outline,
                    label: 'Hobbies',
                    value: 'Coding, Gaming, Watching Anime, Listening to Music',
                    color: const Color(0xFFE67E22),
                  ),
                  _infoCard(
                    icon: Icons.phone_outlined,
                    label: 'Phone Number',
                    value: '+63 966 748 7145',
                    color: const Color(0xFF1ABC9C),
                  ),
                  _infoCard(
                    icon: Icons.star_outline,
                    label: 'Skills',
                    value: 'Flutter, Dart, Python, Java, C++, Git, After Effects, Photoshop',
                    color: const Color(0xFFF39C12),
                  ),

                  const SizedBox(height: 28),

                  // Biography Section
                  _sectionTitle('My Biography'),
                  const SizedBox(height: 14),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 20,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 4,
                              height: 20,
                              decoration: BoxDecoration(
                                color: const Color(0xFF2C3E50),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'About Me',
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF2C3E50),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Text(
                          'I am a passionate Computer Science student based in Iloilo City, Philippines. '
                          'I have a deep love for technology and problem-solving, always eager to learn new '
                          'concepts and apply them in real-world projects. Outside of academics, I enjoy coding '
                          'personal projects, gaming, and listening to music to recharge. I believe in continuous '
                          'growth and take every challenge as an opportunity to improve. My goal is to become a '
                          'skilled software developer who contributes meaningfully to the tech community and makes '
                          'a positive impact through innovation.',
                          style: GoogleFonts.nunito(
                            fontSize: 14.5,
                            color: Colors.grey[700],
                            height: 1.7,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.playfairDisplay(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF2C3E50),
      ),
    );
  }

  Widget _infoCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label.toUpperCase(),
                  style: GoogleFonts.nunito(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: color,
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2C3E50),
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
