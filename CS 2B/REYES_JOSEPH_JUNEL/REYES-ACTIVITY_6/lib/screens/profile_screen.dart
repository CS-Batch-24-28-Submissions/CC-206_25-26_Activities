import 'package:flutter/material.dart';
import 'package:reyes_activity_6/colors.dart';
import 'package:vm_service/utils.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Activity 6',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: AppColors.green700,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header Card
            Card(
              elevation: 2,
              color: AppColors.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    // Profile Picture
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: AppColors.purple500,
                      child: CircleAvatar(
                        radius: 43,
                        backgroundImage: AssetImage('assets/images/profile.png'),
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Name
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Joseph Junel Reyes',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Nice to meet you!',
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.textMid,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Info Section
            Card(
              elevation: 2,
              color: AppColors.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    _buildInfoRow(
                      icon: Icons.cake,
                      label: 'Birthdate',
                      value: 'June 5, 2006',
                    ),
                    _buildDivider(),
                    _buildInfoRow(
                      icon: Icons.home,
                      label: 'Address',
                      value: 'Muging, Banga, Aklan',
                    ),
                    _buildDivider(),
                    _buildInfoRow(
                      icon: Icons.email,
                      label: 'Email',
                      value: 'josephjunel.reyes@wvsu.edu.ph',
                    ),
                    _buildDivider(),
                    _buildInfoRow(
                      icon: Icons.phone_android,
                      label: 'Phone Number',
                      value: '09082135198',
                    ),
                    _buildDivider(),
                    _buildInfoRow(
                      icon: Icons.school,
                      label: 'Education',
                      value: 'West Visayas State University',
                    ),
                    _buildDivider(),
                    _buildInfoRow(
                      icon: Icons.book,
                      label: 'Course',
                      value: 'BS Computer Science',
                    ),
                    _buildDivider(),
                    _buildInfoRow(
                      icon: Icons.favorite,
                      label: 'Hobbies',
                      value: 'Journaling, Reading, Gaming, Jogging',
                    ),
                  ],
                ),
              ),
            ),


            const SizedBox(height: 16),

            // Biography Section
            Card(
              elevation: 2,
              color: AppColors.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Biography',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.purple600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                    '''I’m a 2nd-year Computer Science student at WVSU who lives at the intersection of clean code and intuitive design. '''
                    '''Whether I’m prototyping user-centric solutions in Figma or building out logic for freelance projects, I’m obsessed with making tech accessible. '''
                    '''When I’m not pushing pixels or debugging, you’ll find me climbing the ranks in MLBB or heading home to Aklan to reset.''',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textDark,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.green600, size: 22),
          const SizedBox(width: 16),
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: AppColors.purple600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 13,
                color: AppColors.textDark,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 0.5,
      indent: 16,
      endIndent: 16,
      color: AppColors.green100,
    );
  }
}