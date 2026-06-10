import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Hello, my name is Tim',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF9800),
              ),
            ),
          ),
          const SizedBox(height: 30),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/profile.jpg'),
                backgroundColor: Colors.grey,
              ),
              const SizedBox(width: 25),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tim Matthias Moreno',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Student | West Visayas State University',
                      style: TextStyle(fontSize: 16, color: Color(0xFFFF9800)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),

          const Text(
            'Get to know me!',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFFFF9800)),
          ),
          const SizedBox(height: 15),
          _buildInfoRow(Icons.email, 'Email', 'timmatthias.moreno@wvsu.edu.ph'),
          _buildInfoRow(Icons.phone, 'Phone Number', '0915-535-3305'),
          _buildInfoRow(Icons.cake, 'Birthday', 'May 14, 2005'),
          _buildInfoRow(Icons.sports_esports, 'Hobbies', 'Coding, Gaming, Football, Music'),
          _buildInfoRow(Icons.restaurant, 'Favorite Food', 'Fried chicken & Chicken curry'),
          _buildInfoRow(Icons.location_on, 'Location', 'Iloilo City, Philippines'),

          const SizedBox(height: 40),

          const Text(
            'About me',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 12),
          const Text(
            'Hello I am Tim, a Computer Science student at West Visayas State University.'
            ' I like to code, make music, play video games and football. I enjoy learning new technologies and building useful apps.'
            ' In my free time I play games, create and listen to music, play football, and code. I dream of working in the tech field one day.',
            style: TextStyle(fontSize: 16, height: 1.6, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Card(
      elevation: 2,
      color: const Color(0xFF3C3C3C),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFFFF9800), size: 28),
        title: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
        ),
        trailing: Text(
          value,
          style: const TextStyle(fontSize: 16, color: Colors.white70),
        ),
      ),
    );
  }
}