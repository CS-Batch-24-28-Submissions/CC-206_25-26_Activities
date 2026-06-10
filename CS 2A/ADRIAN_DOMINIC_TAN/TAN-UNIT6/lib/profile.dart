// [IMPORT] Packages
import 'package:flutter/material.dart';

// [PROFILE SCREEN]
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFF1E3A8A),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // [HEADER] Avatar + Name
            const _ProfileHeader(),

            const SizedBox(height: 32),

            // [SECTION] About Me + Info Rows
            const Text(
              'About Me',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E3A8A)),
            ),
            const SizedBox(height: 16),

            _buildInfoRow(Icons.email, 'Email', 'adriandominic.tan@wvsu.edu.ph'),
            _buildInfoRow(Icons.phone, 'Phone', '09460758516'),
            _buildInfoRow(Icons.location_on, 'Location', 'Sto. Niño Sur, Arevalo, Iloilo City, Philippines 5000'),
            _buildInfoRow(Icons.school, 'University', 'West Visayas State University'),
            _buildInfoRow(Icons.school, 'Degree', 'B.S. Computer Science'),
            _buildInfoRow(Icons.favorite, 'Hobbies', 'Coding, Gaming, Badminton, Cycling'),
            _buildInfoRow(Icons.cake, 'Birthday', 'July 29, 2005'),

            const SizedBox(height: 32),

            // [SECTION] Biography
            const Text(
              'My Biography',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E3A8A)),
            ),
            const SizedBox(height: 12),
            const _BiographyCard(),
          ],
        ),
      ),
    );
  }

  // [HELPER] Returns a labelled row with an icon badge, a [label], and a [value].
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Row(
        children: [
          // Icon badge
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFDBEAFE),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: const Color(0xFF1E3A8A), size: 30),
          ),
          const SizedBox(width: 18),
          // Label + value
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 17.5,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F2937),
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

// [WIDGET] Profile: Circular avatar with a blue border alongside the user's name and title.
class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Avatar
        Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFF1E3A8A), width: 4),
            image: const DecorationImage(
              image: AssetImage('assets/images/profile.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 24),
        // Name + headline
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Adrian Dominic Tan',
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: Color(0xFF1F2937)),
              ),
              SizedBox(height: 8),
              Text(
                'Full-stack Web Developer · Mobile App Developer · Tech Enthusiast · Technopreneur',
                style: TextStyle(fontSize: 15.5, color: Colors.grey, height: 1.4),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// [WIDGET] Biography Card: Lightly shaded card that renders the user's biographical paragraph.
class _BiographyCard extends StatelessWidget {
  const _BiographyCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFDBEAFE)),
      ),
      child: const Text(
        "I'm a full-stack web developer and technopreneur passionate about "
        'building software solutions for real-world problems. I love creating '
        'impactful projects and growing my skills through hands-on development.',
        style: TextStyle(fontSize: 16.5, height: 1.65, color: Color(0xFF334155)),
      ),
    );
  }
}