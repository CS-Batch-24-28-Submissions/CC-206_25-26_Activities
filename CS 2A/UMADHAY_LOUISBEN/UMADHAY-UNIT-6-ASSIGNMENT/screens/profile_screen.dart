import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 104, 207, 214),
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header Section
            _buildProfileHeader(),
            
            const SizedBox(height: 24),
            
            // Information Sections
            _buildInfoSection(
              icon: Icons.email,
              label: 'EMAIL',
              value: 'louisbenumadhay@gmail.com',
            ),
            _buildInfoSection(
              icon: Icons.phone,
              label: 'PHONE',
              value: '+63 945 966 8518',
            ),
            _buildInfoSection(
              icon: Icons.location_on,
              label: 'LOCATION',
              value: 'Santa Barbara, Iloilo, Philippines',
            ),
            _buildInfoSection(
              icon: Icons.school,
              label: 'EDUCATION',
              value: 'Bachelor of Science in Computer Science',
            ),
            _buildInfoSection(
              icon: Icons.sports_esports,
              label: 'HOBBIES',
              value: 'Gaming, Football, Coding',
            ),
            _buildInfoSection(
              icon: Icons.work,
              label: 'OCCUPATION',
              value: 'Student at West Visayas State University',
            ),
            _buildInfoSection(
              icon: Icons.favorite,
              label: 'INTERESTS',
              value: 'Golf, Art, Music',
            ),
            
            const SizedBox(height: 24),
            
            // Biography Section
            _buildBiographySection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            // Profile Picture
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/iconimage.png'),
            ),
            const SizedBox(width: 20),
            // Full Name
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Louis Ben Umadhay',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color:  Color.fromARGB(255, 104, 207, 214),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Student at West Visayas State University',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '📍 Santa Barbara, Iloilo, Philippines',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Icon
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color:  Color.fromARGB(255, 104, 207, 214),
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            // Label
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(width: 8),
            // Arrow
            Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: Colors.grey[400],
            ),
            const Spacer(),
            // Value (Data)
            Flexible(
              child: Text(
                value,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBiographySection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.menu_book,
                  color:  Color.fromARGB(255, 104, 207, 214),
                  size: 24,
                ),
                const SizedBox(width: 8),
                const Text(
                  'My Biography',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color:  Color.fromARGB(255, 104, 207, 214),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Divider(
              color: Colors.grey[300],
              height: 1,
            ),
            const SizedBox(height: 12),
            Text(
              'Hello my name is Louis Ben Umadhay, and I am a passionate software developer '
              'from the town of Santa Barbara, Iloilo, Philippines. I am currently pursuing a degree in '
              'Computer Science at West Visayas State University.\n'
              '\n I have a strong interest in technology and programming, and I am always eager to learn new skills and explore innovative solutions.'
              'In my free time, I enjoy gaming, playing football, and coding personal projects. I am also interested in golf, art, and music, which help me relax outside of my studies.\n',
              style: TextStyle(
                fontSize: 15,
                height: 1.6,
                color: Colors.grey[800],
                letterSpacing: 0.3,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}