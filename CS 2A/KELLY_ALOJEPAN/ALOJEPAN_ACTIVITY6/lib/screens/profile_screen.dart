import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6EE),
        body: SingleChildScrollView( 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- HERO HEADER ---
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 36, 24, 32),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF6B4226), Color(0xFF9C6B3C)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                // Avatar with ring
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: const Color(0xFFE8A87C), width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    radius: 52,
                    backgroundImage:
                        AssetImage('assets/images/profile.jpg'),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Kelly Ydrhan Alojepan',
                  style: GoogleFonts.cormorantGaramond(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.3,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: [
                    _chip('CS Student'),
                    _chip('WVSU'),
                    _chip('Dog Lover 🐶'),
                  ],
                ),
              ],
            ),
          ),

          // --- INFO SECTION ---
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 28, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sectionTitle('Personal Info'),
                const SizedBox(height: 14),

                _infoRow(
                  icon: Icons.cake_outlined,
                  label: 'Birthday',
                  value: 'March 15, 2005',
                  color: const Color(0xFFE8A87C),
                ),
                _infoRow(
                  icon: Icons.location_on_outlined,
                  label: 'Address',
                  value: 'Alimodian, Philippines',
                  color: const Color(0xFF27AE60),
                ),
                _infoRow(
                  icon: Icons.email_outlined,
                  label: 'Email',
                  value: 'kelly.alojepan@wvsu.edu.ph',
                  color: const Color(0xFF2980B9),
                ),
                _infoRow(
                  icon: Icons.phone_outlined,
                  label: 'Phone',
                  value: '+63 9763168381',
                  color: const Color(0xFF8E44AD),
                ),
                _infoRow(
                  icon: Icons.school_outlined,
                  label: 'Course',
                  value: 'BS Computer Science',
                  color: const Color(0xFF6B4226),
                ),
                _infoRow(
                  icon: Icons.sports_esports_outlined,
                  label: 'Hobbies',
                  value: 'Gaming, Coding, Hiking',
                  color: const Color(0xFFE74C3C),
                ),
                _infoRow(
                  icon: Icons.music_note_outlined,
                  label: 'Favorite Music',
                  value: 'OPM, R&B, K-Pop',
                  color: const Color(0xFF1ABC9C),
                ),
                 _infoRow(
                  icon: Icons.queue_music_outlined,
                  label: 'Favorite Bands',
                  value: 'Reality Club, Air Supply, TWICE',
                  color: const Color(0xFFF39C12),
                ),


                const SizedBox(height: 28),

                _sectionTitle('Favorite Quote'),
                const SizedBox(height: 14),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF3E6),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: const Color(0xFFE8A87C).withOpacity(0.4),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF6B4226).withOpacity(0.08),
                        blurRadius: 18,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Text(
                    '"He who has a why to live for can bear almost any how." – F. Nietzsche',
                    style: GoogleFonts.dmSans(
                      fontSize: 14.5,
                      fontStyle: FontStyle.italic,
                      color: const Color(0xFF3D2010),
                      height: 1.6,
                    ),
                  ),
                ),

                
                const SizedBox(height: 28),

                _sectionTitle('My Biography'),
                const SizedBox(height: 14),

                // Bio card - different style: left accent bar + warm bg
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEEFDF),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFFE8A87C).withOpacity(0.4),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF6B4226).withOpacity(0.08),
                        blurRadius: 18,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left accent bar
                      Container(
                        width: 6,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF6B4226), Color(0xFFE8A87C)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                      ),
                      // Bio text
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            'I am Kelly Ydrhan Alojepan, a dedicated Computer Science student from West Visayas State University. '
                            'I have a strong passion for technology, problem-solving, and building creative software solutions. '
                            'In my free time, I enjoy gaming, going on hikes, and spending time with my dog Buddy. '
                            'I am always looking for opportunities to grow as a developer and to collaborate with like-minded individuals. '
                            'My dream is to create meaningful applications that make everyday life easier and more enjoyable for people around the world.',
                            style: GoogleFonts.dmSans(
                              fontSize: 14.5,
                              color: const Color(0xFF3D2010),
                              height: 1.75,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 36),
              ],
            ),
          ),
        ],
      ),
    )
    );
    
  }

  Widget _chip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: GoogleFonts.dmSans(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Row(
      children: [
        Container(
          width: 5,
          height: 22,
          decoration: BoxDecoration(
            color: const Color(0xFF6B4226),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: GoogleFonts.cormorantGaramond(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF3D2010),
          ),
        ),
      ],
    );
  }

  Widget _infoRow({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.dmSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey[500],
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: GoogleFonts.dmSans(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF3D2010),
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
