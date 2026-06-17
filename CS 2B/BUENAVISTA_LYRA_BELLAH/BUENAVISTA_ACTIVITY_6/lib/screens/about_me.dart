import 'package:flutter/material.dart';
import '../theme/styles.dart';
import '../widgets/app_drawer.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,

      appBar: AppBar(
        backgroundColor: AppColors.navBg,
        elevation: 0,
        titleSpacing: 0,
        leading: Builder(
          builder: (ctx) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(ctx).openDrawer(),
          ),
        ),

        title: const Text(
          'About Me',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20, fontFamily: 'Poppins', ),
        ), 
      ),

      drawer: const AppDrawer(currentIndex: 1), // drawer index

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Container(
          // -- card 1
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.cardBg,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.cardBorder, width: 1.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _ProfileSection(),
              SizedBox(height: 24),
              _InnerCard(),
            ],
          ),
        ),
      ),
    );
  }
}

// -- Profile section 
class _ProfileSection extends StatelessWidget {
  const _ProfileSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.cardBorder, width: 1.5),
          ),

          child: const CircleAvatar(
            radius: 47,
            backgroundImage: AssetImage('assets/images/pfp.jpg'),
          ),

        ),

        const SizedBox(width: 20),
        
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Lyra Bellah A. Buenavista',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                  fontFamily: 'Poppins',
                )
              ),
              Divider(color: AppColors.divider, height: 20, thickness: 1),
              Text(
                'West Visayas State University',
                style: TextStyle(
                  color: AppColors.textGrey, 
                  fontSize: 12,
                  fontFamily: 'Poppins',
                )
              ),
              SizedBox(height: 4),
              Text(
                'Computer Science',
                style: TextStyle(
                  color: AppColors.textGrey, 
                  fontSize: 12,
                  fontFamily: 'Poppins',
                )
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// -- card 2
class _InnerCard extends StatelessWidget {
  const _InnerCard();

  static const _items = [
    (Icons.email_outlined,      'Email',   'lyrabellahbuenavista@gmail.com'),
    (Icons.phone_outlined,      'Phone',   '09941790962'),
    (Icons.cake_outlined,       'D.O.B',   '08/19/2006'),
    (Icons.psychology_outlined, 'MBTI',    'ISTJ'),
    (Icons.favorite_outline,    'Favorite Artist', 'Tomorrow x Together'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.cardBorder, width: 1.5),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < _items.length; i++) ...[
            if (i != 0) const SizedBox(height: 10),
            _InfoRow(icon: _items[i].$1, label: _items[i].$2, value: _items[i].$3),
          ],

          const SizedBox(height: 28),

          const Text(
            'Biography',
            style: TextStyle(
              fontWeight: FontWeight.w700, 
              fontSize: 16, 
              fontFamily: 'Poppins',
              color: AppColors.navBg
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            "Hi, I'm Lyra! I study Computer Science at WVSU and enjoy the "
            "process of creating through code. Outside of classes, I'm usually "
            "reading, watching films, or listening to TXT. I appreciate clean "
            "systems and am dedicated to building efficient software. ",
            style: TextStyle(color: AppColors.textGrey, fontSize: 12, fontFamily: 'Poppins', height: 1.6),
          ),

          const SizedBox(height: 8),
          
        ],
      ),
    );
  }
}

// --- reusable Info Row
class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _InfoRow({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
      decoration: BoxDecoration(
        color: AppColors.rowBg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.cardBorder, width: 1.01),
      ),
      
      child: Row(
        children: [
          Icon(icon, size: 24, color: AppColors.textDark),
          const SizedBox(width: 14),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.textDark)
              ),
              const SizedBox(height: 2),
              Text(value,
                style: const TextStyle(
                color: AppColors.textGrey, fontSize: 11)
              ),
            ],
          ), 
          )
        ],
      ),
    );
  } 
}