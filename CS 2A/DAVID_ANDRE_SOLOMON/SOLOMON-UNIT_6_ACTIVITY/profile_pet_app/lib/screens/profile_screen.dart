import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // HEADER - Change this title to your name
      appBar: AppBar(
        title: const Text('DAVID ANDRE SOLOMON'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // PROFILE PICTURE SECTION
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.grey[100],
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: const AssetImage('assets/images/profile_pic.jpg'),
                    onBackgroundImageError: (exception, stackTrace) {
                      print('Error loading image: $exception');
                    },
                  ),
                  const SizedBox(width: 20),
                  // Your full name
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'DAVID ANDRE SOLOMON',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Computer Science Student', // 🔴 CHANGE THIS
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),


            _buildInfoRow(
              icon: Icons.email,
              label: 'Email',
              data: 'davidandre.solomon@wvsu.edu.ph',
              color: Colors.red,
            ),
            _buildInfoRow(
              icon: Icons.location_on,
              label: 'Address',
              data: 'Iloilo City, Philippines',
              color: Colors.orange,
            ),
            _buildInfoRow(
              icon: Icons.phone,
              label: 'Phone Number',
              data: '+63 009 678 0933', 
              color: Colors.green,
            ),
            _buildInfoRow(
              icon: Icons.cake,
              label: 'Birthday',
              data: 'April 11, 2006', 
              color: Colors.purple,
            ),
            _buildInfoRow(
              icon: Icons.school,
              label: 'Education',
              data: 'WVSU - Bachelor of Science in CS',
              color: Colors.blue,
            ),
            _buildInfoRow(
              icon: Icons.sports_esports,
              label: 'Hobbies',
              data: 'Gaming, Coding, Watching Series',
              color: Colors.indigo,
            ),
            _buildInfoRow(
              icon: Icons.favorite,
              label: 'Favorite Artist',
              data: 'Keshi',
              color: Colors.pink,
            ),

            // BIOGRAPHY SECTION
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Biography',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Hello! I am David Andre Solomon, a Computer Science student with a strong interest in software development, system design, and technology-driven problem solving. '
                    'I enjoy working on projects involving web development, backend systems, databases, and UI/UX design, especially systems that combine functionality with clean and practical design. '
                    'I am also interested in artificial intelligence, cybersecurity concepts, and improving my skills in modern development tools and frameworks. '
                    'Outside of academics, I spend time exploring new technologies, gaming, troubleshooting technical problems, and continuously learning through hands-on projects and collaboration. '
                    'My goal is to become a highly skilled software engineer capable of building impactful, efficient, and user-focused systems that solve real-world problems.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),
                ],
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
    required String data,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          // Icon
          Icon(
            icon,
            color: color,
            size: 30,
          ),
          const SizedBox(width: 20),
          // Label and Data
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  data,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
