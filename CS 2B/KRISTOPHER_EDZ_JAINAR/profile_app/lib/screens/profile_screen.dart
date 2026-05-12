import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                expandedHeight: 160,
                pinned: true,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    'PROFILE',
                    style: TextStyle(letterSpacing: 6, fontWeight: FontWeight.w900, fontSize: 18),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const _ProfileHero(),
                      const SizedBox(height: 40),
                      const _SectionHeader(title: 'PERSONAL DETAILS'),
                      const _InfoGrid(),
                      const SizedBox(height: 32),
                      const _SectionHeader(title: 'BIOGRAPHY'),
                      const _BioCard(),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileHero extends StatelessWidget {
  const _ProfileHero();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [Color(0xFFE53935), Color(0xFFFF5252)]),
          ),
          child: CircleAvatar(
            radius: 64,
            backgroundColor: Colors.black,
            child: ClipOval(
              child: Image.asset(
                'assets/images/profile.jpg',
                fit: BoxFit.cover,
                width: 128,
                height: 128,
                errorBuilder: (context, _, __) => const Icon(Icons.person, size: 60, color: Colors.white24),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Kristopher Edz Jainar',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 4),
        const Text(
          'Computer Science Student',
          style: TextStyle(
            color: Color(0xFFE53935),
            letterSpacing: 2,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _InfoGrid extends StatelessWidget {
  const _InfoGrid();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            _buildTile(Icons.email_outlined, 'Email', 'kristopheredz.jainar@wvsu.edu.ph'),
            _divider(),
            _buildTile(Icons.school_outlined, 'University', 'West Visayas State University'),
            _divider(),
            _buildTile(Icons.cake_outlined, 'Birthday', 'October 07, 2006'),
            _divider(),
            _buildTile(Icons.palette_outlined, 'Hobbies', 'Coding, Photography, Gaming'),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(IconData icon, String label, String value) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFF2A0000),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: const Color(0xFFE53935), size: 18),
      ),
      title: Text(label, style: const TextStyle(fontSize: 11, color: Colors.white38, fontWeight: FontWeight.bold)),
      subtitle: Text(value, style: const TextStyle(color: Colors.white, fontSize: 14)),
    );
  }

  Widget _divider() => const Divider(height: 1, indent: 70, endIndent: 20, color: Color(0xFF2A2A2A));
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            letterSpacing: 2,
            fontWeight: FontWeight.w900,
            color: Colors.white24,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

class _BioCard extends StatelessWidget {
  const _BioCard();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          'Kristopher is a dedicated Computer Science student at West Visayas State University. He balances academic rigor with a deep passion for coding and the ever-evolving world of technology. Beyond the screen, he is a creative individual inspired by photography and music, and a competitive athlete on the basketball court.',
          style: TextStyle(color: Colors.grey[400], height: 1.8, fontSize: 15),
        ),
      ),
    );
  }
}