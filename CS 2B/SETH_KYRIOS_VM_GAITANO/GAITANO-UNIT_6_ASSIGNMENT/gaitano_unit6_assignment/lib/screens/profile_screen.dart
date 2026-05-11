import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text(
          'Seth Kyrios VM Gaitano',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Card
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
// Profile Picture
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.asset(
                        'assets/images/seth.png',
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Full Name
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Seth Kyrios VM Gaitano',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            color: Color(0xFFB71C1C),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'BS Computer Science',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Info Section Label
            const Padding(
              padding: EdgeInsets.only(left: 4, bottom: 10),
              child: Text(
                'Personal Information',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB71C1C),
                  letterSpacing: 0.5,
                ),
              ),
            ),

            // Info Rows
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    _buildInfoRow(
                      icon: Icons.cake_rounded,
                      label: 'Birthdate',
                      value: 'January 25, 2006',
                    ),
                    _buildDivider(),
                    _buildInfoRow(
                      icon: Icons.home_rounded,
                      label: 'Address',
                      value: 'Buenavista, Guimaras, Philippines',
                    ),
                    _buildDivider(),
                    _buildInfoRow(
                      icon: Icons.email_rounded,
                      label: 'Email',
                      value: 'sethkyrios@gmail.com',
                    ),
                    _buildDivider(),
                    _buildInfoRow(
                      icon: Icons.phone_rounded,
                      label: 'Phone Number',
                      value: '+63 919 463 7270',
                    ),
                    _buildDivider(),
                    _buildInfoRow(
                      icon: Icons.school_rounded,
                      label: 'Education',
                      value: 'West Visayas State University',
                    ),
                    _buildDivider(),
                    _buildInfoRow(
                      icon: Icons.book_rounded,
                      label: 'Course',
                      value: 'Bachelor of Science in Computer Science',
                    ),
                    _buildDivider(),
                    _buildInfoRow(
                      icon: Icons.favorite_rounded,
                      label: 'Hobbies',
                      value: 'Coding, Gaming, Reading, Music',
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Biography Section
            const Padding(
              padding: EdgeInsets.only(left: 4, bottom: 10),
              child: Text(
                'My Biography',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB71C1C),
                  letterSpacing: 0.5,
                ),
              ),
            ),

            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'I am Seth Kyrios VM Gaitano. I live in Tastasan Buenavista Guimaras. '
                  'I have a pet dog I call "Totoy" and he is colored black. '
                  'I study Computer Science in West Visayas State University because I feel '
                  'like its my calling.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFEEEEEE),
                    height: 1.6,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),

            const SizedBox(height: 20),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 22, color: const Color(0xFFB71C1C)),
          const SizedBox(width: 14),
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFFB0B0B0),
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFFE0E0E0),
                fontWeight: FontWeight.w500,
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
      thickness: 0.5,
      indent: 52,
      endIndent: 16,
      color: Color(0xFF424242),
    );
  }
}