import 'package:flutter/material.dart';
import '../main.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeroSection(),
                const SizedBox(height: 16),
                _buildInfoSection(),
                const SizedBox(height: 16),
                _buildBioSection(),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar _buildAppBar() {
    return const SliverAppBar(
      title: Text('Samantha Lisha Ortega'),
      backgroundColor: AppTheme.primary,
      foregroundColor: Colors.white,
      pinned: true,
      floating: false,
      expandedHeight: 0,
    );
  }

  Widget _buildHeroSection() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.primary, AppTheme.primaryLight],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      child: Row(
        children: [
          // Profile picture
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryDark.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/profile.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Center(
                  child: Text(
                    'SR',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primary,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Name & subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Samantha Lisha Ortega',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'CS Student · WVSU, Iloilo city',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.85),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    final List<Map<String, dynamic>> infoItems = [
      {
        'icon': Icons.email_outlined,
        'label': 'Email',
        'value': 'samanthalisha.ortega@wvsu.edu.ph',
      },
      {
        'icon': Icons.location_on_outlined,
        'label': 'Location',
        'value': 'Iloilo city, Philippines',
      },
      {
        'icon': Icons.phone_outlined,
        'label': 'Contact',
        'value': '+63-947-239-3469',
      },
      {
        'icon': Icons.school_outlined,
        'label': 'Course, Year, and Section',
        'value': 'BS Computer Science - 2B',
      },
      {
        'icon': Icons.star_outline_rounded,
        'label': 'Hobbies',
        'value': 'Coding, Design, Sleeping',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppTheme.border, width: 0.8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 14, 16, 4),
              child: Text(
                'ABOUT ME',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primaryDark,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            ...infoItems.asMap().entries.map((entry) {
              final i = entry.key;
              final item = entry.value;
              return Column(
                children: [
                  if (i > 0)
                    const Divider(
                      height: 1,
                      thickness: 0.5,
                      color: AppTheme.primarySurface,
                      indent: 56,
                    ),
                  _InfoRow(
                    icon: item['icon'] as IconData,
                    label: item['label'] as String,
                    value: item['value'] as String,
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildBioSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppTheme.border, width: 0.8),
        ),
        padding: const EdgeInsets.all(16),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Biography',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppTheme.primary,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Hi! I'm Samantha, a Computer Science student at West Visayas "
              "State University in Iloilo city. I'm passionate about "
              "civic tech, mobile development, and creating meaningful digital "
              "experiences for local communities. Outside of code, I enjoy "
              "sipping matcha, obsessing over aesthetic design systems, and "
              "joining hackathons with my team — 3rd placer at SikapTala Nationals 2025, "
              "3rd placer at UPV Komsai Hack 2026, and champion at BizCon 2026. I believe technology, when "
              "built with heart, can genuinely change lives.",
              style: TextStyle(
                fontSize: 13.5,
                height: 1.65,
                color: AppTheme.textMed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: AppTheme.primarySurface,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(icon, size: 17, color: AppTheme.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: AppTheme.textHint,
              ),
            ),
          ),
          Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              softWrap: true,
              style: const TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w600,
                color: AppTheme.textDark,
                height: 1.6,
              ),
            ),
          ),
          ),
        ],
      ),
    );
  }
}
