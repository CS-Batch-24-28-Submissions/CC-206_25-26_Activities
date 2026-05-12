import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/info_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 'Profile' with Icon
            Row(
              children: [
                Icon(Icons.person, color: AppColors.textDark, size: 28),
                const SizedBox(width: 10),
                const Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
              ],
            ),

            // Actual Profile
            const SizedBox(height: 25),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryPurple.withValues(alpha: 0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: AppColors.primaryPurple,
                    child: const CircleAvatar(
                      radius: 42,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Aliyah Mariel Santos',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    Text(
                      'BSCS 2B',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textLight,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Information Section
            const Text(
              'Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 15),

            // Info Cards
            const InfoCard(
              icon: Icons.email,
              label: 'Email',
              value: 'aliyahmariel.santos@wvsu.edu.ph',
            ),
            const InfoCard(
              icon: Icons.cake,
              label: 'Birthday',
              value: 'September 9, 2006',
            ),
            const InfoCard(
              icon: Icons.music_note,
              label: 'Hobbies',
              value: 'Walking, Running, Playing Guitar',
            ),
            const InfoCard(
              icon: Icons.favorite,
              label: 'Interests',
              value: 'Web Development, AI, UI/UX, Robotics, Business, Finance',
            ),
            const InfoCard(
              icon: Icons.radar,
              label: 'Goal',
              value: 'To transform ideas into realities that make an impact.',
            ),

            const SizedBox(height: 20),
            const Text(
              'About Me',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Hi! I am Aliyah Mariel Santos, a 2nd-year BS Computer Science student at West Visayas State University - Main Campus. I am driven by curiosity and a quiet determination to turn my ideas into systems that matter, creating solutions to real world problems and making an impact.',
              style: TextStyle(color: Colors.black87, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
