import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfileHero(),
          const SizedBox(height: 8),
          _buildInfoSection(),
          const SizedBox(height: 8),
          _buildBiographySection(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // ── Profile Hero: picture + full name ───────────────────────────────────
  Widget _buildProfileHero() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 36,
            backgroundColor: const Color(0xFFE3F0FF),
            backgroundImage: const AssetImage('assets/images/profile.jpg'),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nathan Jez E. Sarrosa',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1D23),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Computer Science Student',
                  style: TextStyle(fontSize: 13, color: Color(0xFF6B7280)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Info rows: icon + label + value ─────────────────────────────────────
  Widget _buildInfoSection() {
    final items = [
      _InfoItem(Icons.cake_outlined,        'Birthday',     'September 27, 2005'),
      _InfoItem(Icons.location_on_outlined,  'Address',      'Iloilo City, Philippines'),
      _InfoItem(Icons.email_outlined,        'Email',        'nathanjez.sarrosa@wvsu.edu.ph'),
      _InfoItem(Icons.phone_outlined,        'Phone Number', '09957786868'),
      _InfoItem(Icons.school_outlined,       'Education',    'West Visayas State University'),
      _InfoItem(Icons.menu_book_outlined,    'Course',       'BS Computer Science'),
      _InfoItem(Icons.star_outline,          'Hobbies',      'Exercise, Gaming, Eating sweets, Chilling'),
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(children: items.map(_buildInfoRow).toList()),
    );
  }

  Widget _buildInfoRow(_InfoItem item) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFFEBF4FF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(item.icon, size: 18, color: const Color(0xFF4A90D9)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.label.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 10,
                        letterSpacing: 0.8,
                        color: Color(0xFF9CA3AF),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      item.value,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF1A1D23),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1, color: Color(0xFFE5E7EB)),
      ],
    );
  }

  // ── Biography section ────────────────────────────────────────────────────
  Widget _buildBiographySection() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Biography',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1D23),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Born and raised in Iloilo City, I started out as a timid shy kid '
            'but growing up, I found my confidence through my friends and loved ones. '
            'I grew up playing video games and boosting my confidence through exercise. '
            'I like listening to music, could be pop, metal, etc. It is one of my therapies. '
            'I strive to live life to the fullest, constantly learning and growing, '
            'one step at a time.',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF6B7280),
              height: 1.65,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Helper data class ────────────────────────────────────────────────────────
class _InfoItem {
  final IconData icon;
  final String label;
  final String value;
  const _InfoItem(this.icon, this.label, this.value);
}
