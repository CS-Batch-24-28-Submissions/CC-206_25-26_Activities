import 'package:flutter/material.dart';

// profile screen widget
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F0E8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            // layout padding for main content
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _ProfileHeader(), // header section
                  _SectionLabel('Target Profile'), // section label
                  _ProfileBlock(), // profile block with photo + info
                  _SectionLabel('Intelligence Data'),
                  _InfoRows(), // info rows list
                  _SectionLabel('Psychological Profile'),
                  _BioBlock(), // biography block
                  _SectionLabel('Biometric Record'),
                  _FingerprintRow(), // fingerprint + biometric row
                  _FooterBar(), // footer bar
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// header section with logo + stamp
class _ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1A1A1A),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
      child: Row(
        children: [
          // circular logo
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
          // academic division + profile title
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
          // red stamp rotated
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
                      Text(
                        'ENROLLED',
                        style: TextStyle(
                          color: Color(0xFFC0392B),
                          fontSize: 7,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'ACTIVE\nSTATUS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFC0392B),
                          fontSize: 10,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w900,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'VERIFIED',
                        style: TextStyle(
                          color: Color(0xFFC0392B),
                          fontSize: 7,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
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

// section label widget
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
          color: Color(0xFF1A1A1A),
          fontSize: 10,
          letterSpacing: 3,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

// profile block with photo + details
class _ProfileBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // subject photo box
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
                        errorBuilder: (_, __, ___) =>
                            const Icon(Icons.person_outline, size: 52, color: Color(0xFF5A5A5A)),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'PHOTO\nON FILE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 9,
                          letterSpacing: 1,
                          color: Color(0xFF5A5A5A),
                        ),
                      ),
                    ],
                  ),
                ),
                // bottom label
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: const Color(0xFF1A1A1A),
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: const Text(
                      'SUBJECT PHOTO',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFF5F0E8),
                        fontSize: 8,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 32),
          // name + program details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'LAWI, AHLIA G.',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF1A1A1A),
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  height: 2,
                  width: 60,
                  color: const Color(0xFFC0392B),
                ),
                const SizedBox(height: 14),
                _IdRow('Program', 'BSCS — 2A'),
                _IdRow('Batch', "CLASS OF '28", isRed: true),
                _IdRow('MBTI Type', 'INFP'),
                const SizedBox(height: 12),
                // pet record
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF2A2A2A), width: 1),
                  ),
                  child: const Text(
                    'PET ON RECORD: KITCAT',
                    style: TextStyle(
                      fontSize: 9,
                      letterSpacing: 1.5,
                      color: Color(0xFF5A5A5A),
                    ),
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

// id row widget for label + value
class _IdRow extends StatelessWidget {
  final String label, value;
  final bool isRed;
  const _IdRow(this.label, this.value, {this.isRed = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          // label text
          SizedBox(
            width: 90,
            child: Text(
              label.toUpperCase(),
              style: const TextStyle(
                fontSize: 9,
                letterSpacing: 1.5,
                color: Color(0xFF5A5A5A),
              ),
            ),
          ),
          // value text
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
              color: isRed ? const Color(0xFFC0392B) : const Color(0xFF1A1A1A),
            ),
          ),
        ],
      ),
    );
  }
}

// info rows section
class _InfoRows extends StatelessWidget {
  static const _items = [
    _InfoData(Icons.email_outlined, 'EMAIL', 'ahlia.lawi@wvsu.edu.ph'),
    _InfoData(Icons.cake_outlined, 'BIRTHDAY', 'February 10, 2006'),
    _InfoData(Icons.location_on_outlined, 'ADDRESS', 'Iloilo City, Philippines'),
    _InfoData(Icons.school_outlined, 'UNIVERSITY', 'West Visayas State University'),
    _InfoData(Icons.favorite_outline, 'HOBBIES',
        'Collecting stuff · Reading fiction · Listening to music · Doom scrolling · Reconnecting with nature'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _items.asMap().entries.map((e) {
        final isLast = e.key == _items.length - 1;
        return _InfoRow(e.value, showDivider: !isLast);
      }).toList(),
    );
  }
}

// info data model
class _InfoData {
  final IconData icon;
  final String label, value;
  const _InfoData(this.icon, this.label, this.value);
}

// single info row widget
class _InfoRow extends StatelessWidget {
  final _InfoData data;
  final bool showDivider;
  const _InfoRow(this.data, {this.showDivider = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // row content
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // icon box
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF2A2A2A), width: 1),
                ),
                child: Icon(data.icon, size: 16, color: const Color(0xFF1A1A1A)),
              ),
              const SizedBox(width: 16),
              // label text
              SizedBox(
                width: 110,
                child: Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Text(
                    data.label,
                    style: const TextStyle(
                      fontSize: 9,
                      letterSpacing: 2,
                      color: Color(0xFF5A5A5A),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              // value text
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Text(
                    data.value,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF1A1A1A),
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // optional divider
        if (showDivider)
          Container(
            height: 1,
            margin: const EdgeInsets.symmetric(horizontal: 32),
            color: const Color(0xFF2A2A2A).withOpacity(0.12),
          ),
      ],
    );
  }
}

// biography block section
class _BioBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'MY BIOGRAPHY',
            style: TextStyle(
              fontSize: 10,
              letterSpacing: 3,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 1,
            color: const Color(0xFF2A2A2A).withOpacity(0.2),
          ),
          const SizedBox(height: 14),
          // biography text
          const Text(
            "I'm someone who's really curious about how people think and why they do the things they do. Right now, I'm a BS Computer Science student just trying to survive the program, so far, still doing okay. Outside of school, I like collecting random things I get obsessed with, reading fiction, listening to music, and doing a bit of doom scrolling. I also enjoy taking breaks to reconnect with nature when things get overwhelming. Most of my perspective comes from observing everyday life, struggles, and resilience, which kind of shapes how I see both people and the world around me.",
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF2A2A2A),
              height: 1.85,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}

// fingerprint + biometric row
class _FingerprintRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _FpGroup('Fingerprint Analysis'), // left group
          const Column(
            children: [
              Text(
                'CODENAME: AHLIA-01',
                style: TextStyle(
                  fontSize: 9,
                  letterSpacing: 1,
                  color: Color(0xFFC0392B),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'FILE NO: ILO-2028',
                style: TextStyle(
                  fontSize: 9,
                  letterSpacing: 1,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'BY WVSU-CICT',
                style: TextStyle(
                  fontSize: 9,
                  letterSpacing: 1,
                  color: Color(0xFF5A5A5A),
                ),
              ),
            ],
          ),
          _FpGroup('Biometric Score'), // right group
        ],
      ),
    );
  }
}

// fingerprint group widget
class _FpGroup extends StatelessWidget {
  final String label;
  const _FpGroup(this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // group label
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            fontSize: 7,
            letterSpacing: 1.5,
            color: Color(0xFF5A5A5A),
          ),
        ),
        const SizedBox(height: 6),
        // fingerprint boxes
        Row(
          children: List.generate(
            5,
            (_) => Container(
              width: 18,
              height: 22,
              margin: const EdgeInsets.only(right: 3),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF2A2A2A), width: 1),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(9),
                  bottom: Radius.circular(7),
                ),
              ),
              child: Center(
                child: Container(
                  width: 10,
                  height: 12,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF5A5A5A), width: 0.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// footer bar section
class _FooterBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // widths and heights for decorative bars
    final widths = [1.0, 2.0, 1.0, 3.0, 1.0, 2.0, 1.0, 2.0, 3.0, 1.0, 2.0, 1.0];
    final heights = [18.0, 18.0, 18.0, 18.0, 12.0, 18.0, 12.0, 18.0, 18.0, 18.0, 12.0, 18.0];

    return Container(
      color: const Color(0xFF1A1A1A),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left text
          const Text(
            'WVSU-RECORDS',
            style: TextStyle(
              color: Color(0xFFF5F0E8),
              fontSize: 9,
              letterSpacing: 1.5,
            ),
          ),
          // decorative bar sequence
          Row(
            children: List.generate(
              12,
              (i) => Container(
                width: widths[i],
                height: heights[i],
                margin: const EdgeInsets.only(right: 1),
                color: const Color(0xFFF5F0E8),
              ),
            ),
          ),
          // right text
          const Text(
            'CICTZEN-001',
            style: TextStyle(
              color: Color(0xFFF5F0E8),
              fontSize: 9,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
