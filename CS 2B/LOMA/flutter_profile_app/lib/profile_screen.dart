import 'package:flutter/material.dart';
 
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      body: Column(
        children: [
          // Header
          _buildHeader(),
          // Body
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildProfileCard(),
                  const SizedBox(height: 16),
                  _buildInfoCard(),
                  const SizedBox(height: 16),
                  _buildBiographyCard(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
 
  //  HEADER
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      color: const Color(0xFF1A2A4A),
      padding: const EdgeInsets.fromLTRB(20, 48, 20, 16),
      child: const Text(
        'DANIEL VINCENT LOMA',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
  //  PROFILE CARD  (photo + name)
  Widget _buildProfileCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Profile picture
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF1A2A4A),
                width: 3,
              ),
              color: const Color(0xFFD0D8E8),
            ),
            child: ClipOval(
              child: Image.asset(
              'assets/profile.jpg.jpg',
              width: 90,
              height: 90,
              fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20),
          // Name
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Daniel Vincent Loma',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A2A4A),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'BS Computer Science',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
 
  //  INFO CARD 
  Widget _buildInfoCard() {
    final List<Map<String, dynamic>> infoItems = [
      {
        'icon': Icons.cake_outlined,
        'label': 'Birthdate',
        'value': 'September 07, 2006',
      },
      {
        'icon': Icons.home_outlined,
        'label': 'Address',
        'value': 'Guimaras, Philippines',
      },
      {
        'icon': Icons.email_outlined,
        'label': 'Email',
        'value': 'danielvincent.loma@wvsu.edu.ph',
      },
      {
        'icon': Icons.phone_outlined,
        'label': 'Phone Number',
        'value': '09459747166',
      },
      {
        'icon': Icons.school_outlined,
        'label': 'Education',
        'value': 'West Visayas State University',
      },
      {
        'icon': Icons.book_outlined,
        'label': 'Course',
        'value': 'Bachelor of Science in Computer Science',
      },
      {
        'icon': Icons.favorite_outline,
        'label': 'Hobbies',
        'value': 'Reading, Gaming, Cooking',
      },
    ];
 
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dividers between items but not before the first
          for (int i = 0; i < infoItems.length; i++) ...[
            if (i != 0)
              const Divider(height: 1, color: Color(0xFFEEEEEE)),
            _buildInfoRow(
              icon: infoItems[i]['icon'] as IconData,
              label: infoItems[i]['label'] as String,
              value: infoItems[i]['value'] as String,
            ),
          ],
        ],
      ),
    );
  }
 
  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: const Color(0xFF1A2A4A).withOpacity(0.08),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 20, color: const Color(0xFF1A2A4A)),
          ),
          const SizedBox(width: 14),
          // Label + Value
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A2A4A),
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF555555),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
 

  //  BIOGRAPHY CARD
  Widget _buildBiographyCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'My Biography',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A2A4A),
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Growing up in the vibrant province of Guimaras,'
            'an aspiring second-year Computer Science student at West Visayas State '
            'University, where I am constantly challenging myself to learn '
            'new things and grow as a developer.',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF555555),
              height: 1.65,
            ),
          ),
        ],
      ),
    );
  }
}
 