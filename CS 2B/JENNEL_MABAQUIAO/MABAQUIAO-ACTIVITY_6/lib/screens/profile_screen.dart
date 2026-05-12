import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text(
          'Jennel F. Mabaquiao',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: const Color(0xFF800000), // Maroon
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header Card

            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF800000), // Maroon
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
              child: Row(
                children: [
                  // Profile Picture

                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/profile.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.person, color: Colors.white, size: 40),
                              Text(
                                'Add Photo',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Full Name

                  const Expanded(
                    child: Text(
                      'Jennel F. Mabaquiao',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Info section

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      _buildInfoRow(
                        icon: Icons.school,
                        label: 'Course',
                        value: 'Bachelor of Science in Computer Science',
                      ),
                      _buildDivider(),
                      _buildInfoRow(
                        icon: Icons.cake,
                        label: 'Birthday',
                        value: 'October 6, 2005',
                      ),
                      _buildDivider(),
                      _buildInfoRow(
                        icon: Icons.location_on,
                        label: 'Address',
                        value: 'Villavert-Jimenez, Hamtic, Antique',
                      ),
                      _buildDivider(),
                      _buildInfoRow(
                        icon: Icons.email,
                        label: 'Email',
                        value: 'jennel.mabaquiao@wvsu.edu.ph',
                      ),
                      _buildDivider(),
                      _buildInfoRow(
                        icon: Icons.music_note,
                        label: 'Fav Artist',
                        value: 'NMIXX, tripleS, NCT',
                      ),
                      _buildDivider(),
                      _buildInfoRow(
                        icon: Icons.sports_esports,
                        label: 'Hobbies',
                        value: 'Play rhythm games, read fanfictions',
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Biography Section

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.auto_stories, color: Color(0xFF800000)),
                          SizedBox(width: 8),
                          Text(
                            'My Biography',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF800000),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'I am Jennel Mabaquiao, a 2nd year BSCS Major in AI student in WVSU, and i am 20 years old. '
                        'I do UI/UX designs for group projects, and i like to read and listen to kpop as a pastime. '
                        'My favorite niche is watching Taiwanese horror movies.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          height: 1.6,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF800000), size: 22),
          const SizedBox(width: 12),
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black54,
                fontSize: 13,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      height: 1,
      indent: 16,
      endIndent: 16,
      color: Color(0xFFEEEEEE),
    );
  }
}
