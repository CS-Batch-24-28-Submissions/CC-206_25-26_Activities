import 'package:flutter/material.dart';

// ── Color Palette ──────────────────────────────────────────────────────────
const kPrimary    = Color(0xFF6B4F72); // deep plum
const kAccent     = Color(0xFFD5B0F3); // main purple (D5B0F3)
const kLilac      = Color(0xFFC8B2D6); // lilac
const kEarth      = Color(0xFFA0785A); // warm earth brown
const kEarthLight = Color(0xFFEDE0D4); // light earth / cream
const kBg         = Color(0xFFF7F0FB); // soft lavender white background
const kText       = Color(0xFF3B2A40); // dark plum text

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      appBar: AppBar(
        title: const Text(
          'Imylene F. Delfin',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
        backgroundColor: kPrimary,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [

            // ── Profile Picture + Name (centered) ──────────────────
            Column(
              children: [
                // Circular profile picture
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: kAccent, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: kAccent.withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/profile.webp',
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: kLilac,
                        child: const Icon(Icons.person, size: 55, color: kPrimary),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                // Full name
                const Text(
                  'Imylene F. Delfin',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: kText,
                  ),
                ),

                const SizedBox(height: 6),

                // Course badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                  decoration: BoxDecoration(
                    color: kAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'BSCS 2B — AI',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: kText,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // ── Info Rows (centered) ────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: kAccent.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _infoRow(Icons.cake_outlined,        'Birthday', 'December 16, 2006'),
                  _infoRow(Icons.location_on_outlined, 'Address',  'Iloilo City, Philippines'),
                  _infoRow(Icons.email_outlined,       'Email',    'imylene.delfin@wvsu.edu.ph'),
                  _infoRow(Icons.phone_outlined,       'Phone',    '+63 962 521 6417'),
                  _infoRow(Icons.school_outlined,      'School',   'West Visayas State University'),
                  _infoRow(Icons.tv,                   'Hobbies',  'Watching Dramas, Reading, Walking, Going Out', isLast: true),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ── Biography (centered) ────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: kAccent.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Title centered
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 4, height: 20,
                        decoration: BoxDecoration(
                          color: kEarth,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Who is Imylene?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: kText,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 4, height: 20,
                        decoration: BoxDecoration(
                          color: kEarth,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  const Text(
                    'She is a BS Computer Science student at West Visayas State University.'
                    'As a science student, she is balancing work responsibilities and school while giving her '
                    'best in everything she does. She enjoys learning new things, exploring new places, '
                    'and meeting new people. Outside of academics, she loves watching dramas, reading,' 
                    'walking, and going out. She believes that every experience — inside or outside the' 
                    'classroom — is an opportunity to grow and become a better version of herself.'
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.5,
                      height: 1.75,
                      color: Color(0xFF5A4A60),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value, {bool isLast = false}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: kEarthLight,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 18, color: kEarth),
              ),
              const SizedBox(width: 12),
              // Label + Value centered
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      label.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: kLilac,
                        letterSpacing: 0.8,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      value,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w500,
                        color: kText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (!isLast)
          Divider(color: kAccent.withOpacity(0.2), height: 1),
      ],
    );
  }
}
