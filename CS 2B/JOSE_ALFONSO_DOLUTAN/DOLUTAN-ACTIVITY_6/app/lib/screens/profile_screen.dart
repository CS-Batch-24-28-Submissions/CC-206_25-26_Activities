import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.title});

  final String title;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget _buildInfoRow(
    IconData icon, 
    Color iconColor, 
    String label, 
    String value, 
  ) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, color: iconColor, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
                  Text(
                    value,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // 1. Removed Scaffold and AppBar
    // 2. Added SingleChildScrollView so the user can scroll through your portfolio
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assets/images/pfp.jpg',
                    ), 
                    backgroundColor: Colors.grey,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Jose Alfonso E. Dolutan', 
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Aspiring Cloud Engineer || Project Manager', 
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic, 
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Personal Information', 
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  _buildInfoRow(
                    Icons.email,
                    Colors.purple,
                    'Email',
                    'business.alfonsodolutan@gmail.com',
                  ),
                  _buildInfoRow(
                    Icons.location_on,
                    Colors.red,
                    'Address',
                    '26 Fajardo Extention, Jaro, Iloilo City',
                  ),
                  _buildInfoRow(
                    Icons.tv,
                    Colors.blue,
                    'Favorite Show',
                    'Pacific Rim',
                  ),
                  _buildInfoRow(
                    Icons.music_note,
                    Colors.green,
                    'Favorite Song',
                    'Yo x Ti, Tu x Mi by Rosalia & Ozuna',
                  ),
                  _buildInfoRow(
                    Icons.favorite,
                    Colors.pink,
                    'Hobbies',
                    'Football, Sim-Racing, Working Out, Sleeping, Music',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Biography',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Jose Alfonso "Fons" Dolutan is a 2nd year student currently studying Computer Science in West Visayas State University. His goal in the future is to work as a "Project Manager" or "Cloud Engineer". He dreams to work for an overseas company like AWS or Google Cloud. He loves watching sports, cheering for FC Barcelona and McLaren Mastercard Formula One Team respectively. Currently, he is studying using AWS Skill Builder to further improve his knowledge about the cloud.',
                    style: TextStyle(fontSize: 14, height: 1.5),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32), // A little extra padding at the very bottom
        ],
      ),
    );
  }
}