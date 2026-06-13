import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // ── Info row data ──────────────────────────────────────────────────
  static const List<Map<String, dynamic>> _infoRows = [
    {
      'icon': Icons.email_outlined,
      'label': 'Email',
      'value': 'claytoncaballero.tc@gmail.com',
      'color': Color(0xFF6C63FF),
    },
    {
      'icon': Icons.cake_outlined,
      'label': 'Birthday',
      'value': 'December 28, 2005',
      'color': Color(0xFFFF6584),
    },
    {
      'icon': Icons.location_on_outlined,
      'label': 'Location',
      'value': 'Iloilo City, Philippines',
      'color': Color(0xFF43C59E),
    },
    {
      'icon': Icons.sports_esports_outlined,
      'label': 'Hobbies',
      'value': 'Gaming, Reading, Analysis, Singing',
      'color': Color(0xFFFF8E53),
    },
    {
      'icon': Icons.school_outlined,
      'label': 'Course',
      'value': 'BS Computer Science',
      'color': Color(0xFF4FC3F7),
    },
    {
      'icon': Icons.favorite_outline,
      'label': 'Technical Skills',
      'value': 'UI/UX, WebDev, AI, Team Management',
      'color': Color(0xFFBA68C8),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3FF),
      body: CustomScrollView(
        slivers: [
          // ── Collapsible Header ──────────────────────────────────────
          SliverAppBar(
            expandedHeight: 120,
            pinned: true,
            backgroundColor: const Color(0xFF6C63FF),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text(
                'Clayton T. Caballero',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF6C63FF), Color(0xFF9B8FFF)],
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Profile Card (picture + name) ──────────────────
                  _ProfileCard(),

                  const SizedBox(height: 24),

                  // ── Info Rows Section ─────────────────────────────
                  _SectionTitle(title: 'About Me'),
                  const SizedBox(height: 12),
                  _InfoRowsCard(),

                  const SizedBox(height: 24),

                  // ── Biography Section ─────────────────────────────
                  _SectionTitle(title: 'My Biography'),
                  const SizedBox(height: 12),
                  _BiographyCard(),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Profile Card ────────────────────────────────────────────────────────────
class _ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6C63FF).withOpacity(0.10),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          // Profile picture
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF6C63FF).withOpacity(0.25),
                  blurRadius: 14,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: const Color(0xFFE8E5FF),
              backgroundImage: const AssetImage('assets/images/profile.jpg'),
              onBackgroundImageError: (_, __) {},
              child: ClipOval(
                child: Image.asset(
                  '/images/profile.jpg',
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.person,
                    size: 56,
                    color: Color(0xFF6C63FF),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),

          // Name + subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Clayton T. Caballero',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D2B55),
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6C63FF).withOpacity(0.10),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'CS Student & Team Leader',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6C63FF),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.star, color: Color(0xFFFFD700), size: 16),
                    const Icon(Icons.star, color: Color(0xFFFFD700), size: 16),
                    const Icon(Icons.star, color: Color(0xFFFFD700), size: 16),
                    const Icon(Icons.star, color: Color(0xFFFFD700), size: 16),
                    const Icon(Icons.star_half,
                        color: Color(0xFFFFD700), size: 16),
                    const SizedBox(width: 6),
                    Text(
                      'Flutter Dev',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Info Rows Card ───────────────────────────────────────────────────────────
class _InfoRowsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6C63FF).withOpacity(0.10),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: ProfileScreen._infoRows.asMap().entries.map((entry) {
          final index = entry.key;
          final row = entry.value;
          final isLast = index == ProfileScreen._infoRows.length - 1;

          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Row(
                  children: [
                    // Icon container
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: (row['color'] as Color).withOpacity(0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        row['icon'] as IconData,
                        color: row['color'] as Color,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 14),

                    // Label
                    SizedBox(
                      width: 80,
                      child: Text(
                        row['label'] as String,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey.shade500,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),

                    // Value
                    Expanded(
                      child: Text(
                        row['value'] as String,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2D2B55),
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
              if (!isLast)
                Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.grey.shade100,
                  indent: 72,
                ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

// ── Biography Card ───────────────────────────────────────────────────────────
class _BiographyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6C63FF).withOpacity(0.10),
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
                  color: const Color(0xFF6C63FF),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'A Little About Me',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6C63FF),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            "Hello there, I am Clayton T. Caballero, a student of WVSU CICT in Computer Science in the city of Iloilo, Philippines. \n "
            "I live in Jalandoni Estate - Lapuz, Iloilo City "
            "I have multiple interests in creative works from reading multiple novels, books, mangas, manhwas, manhuas. I enjoy watching films and tv shows, and also youtube"
            "\n I am also a gamer and a singer"
            "\n I have a pet dog named Lala, she is a shitzu-apso breed.",
            style: TextStyle(
              fontSize: 14.5,
              color: Colors.grey.shade700,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Reusable Section Title ───────────────────────────────────────────────────
class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFF2D2B55),
      ),
    );
  }
}
