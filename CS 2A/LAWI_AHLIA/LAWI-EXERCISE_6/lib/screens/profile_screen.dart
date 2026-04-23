import 'package:flutter/material.dart';

// profile screen
// displays student profile with detailed sections
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F0E8),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            // allows full width layout
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 32),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _ProfileHeader(),
                  _SectionLabel('Target Profile'),
                  _ProfileBlock(),
                  _SectionLabel('Intelligence Data'),
                  _InfoRows(),
                  _SectionLabel('Psychological Profile'),
                  _BioBlock(),
                  _SectionLabel('Biometric Record'),
                  _FingerprintRow(),
                  _FooterBar(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// header section
class _ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1A1A1A),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),

      child: Row(
        children: [
          // circular badge
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFF5F0E8), width: 1.5),
            ),
            child: const Center(
              child: Text(
                'WVSU',
                style: TextStyle(
                  color: Color(0xFFF5F0E8),
                  fontSize: 7,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ),

          const SizedBox(width: 14),

          // header text info
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Academic Records Division',
                  style: TextStyle(
                    color: Color(0x88F5F0E8),
                    fontSize: 10,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'STUDENT PROFILE',
                  style: TextStyle(
                    color: Color(0xFFF5F0E8),
                    fontSize: 16,
                    letterSpacing: 4,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  '#BSCS-2A-2028-001',
                  style: TextStyle(
                    color: Color(0x44F5F0E8),
                    fontSize: 10,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),

          // stamp badge
          Transform.rotate(
            angle: -0.26,
            child: Container(
              width: 84,
              height: 84,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFC0392B), width: 2.5),
              ),
              child: Center(
                child: Container(
                  width: 74,
                  height: 74,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFC0392B).withOpacity(0.35),
                      width: 1,
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('ENROLLED', style: TextStyle(color: Color(0xFFC0392B), fontSize: 7)),
                      SizedBox(height: 2),
                      Text('ACTIVE\nSTATUS', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFFC0392B), fontSize: 10)),
                      SizedBox(height: 2),
                      Text('VERIFIED', style: TextStyle(color: Color(0xFFC0392B), fontSize: 7)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// section label
class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFE8E2D4),
        border: Border.symmetric(
          horizontal: BorderSide(color: Color(0xFF2A2A2A), width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          fontSize: 10,
          letterSpacing: 3,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

// profile block section
class _ProfileBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // profile image
          Container(
            width: 120,
            height: 150,
            decoration: BoxDecoration(
              color: const Color(0xFFD4CFC4),
              border: Border.all(color: const Color(0xFF2A2A2A), width: 1.5),
            ),
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/profile.jpg',
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(Icons.person_outline, size: 52),
                      ),
                      const SizedBox(height: 6),
                      const Text('PHOTO\nON FILE', textAlign: TextAlign.center, style: TextStyle(fontSize: 9)),
                    ],
                  ),
                ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: const Color(0xFF1A1A1A),
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: const Text('SUBJECT PHOTO', textAlign: TextAlign.center),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 32),

          // name + info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('LAWI, AHLIA G.', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// info row data model
class _InfoData {
  final IconData icon;
  final String label;
  final String value;
  const _InfoData(this.icon, this.label, this.value);
}

// info rows section
class _InfoRows extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column();
  }
}

// biography section
class _BioBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(32),
      child: Text('biography here'),
    );
  }
}

// fingerprint section
class _FingerprintRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

// footer section
class _FooterBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1A1A1A),
      padding: const EdgeInsets.all(16),
      child: const Text('footer'),
    );
  }
}