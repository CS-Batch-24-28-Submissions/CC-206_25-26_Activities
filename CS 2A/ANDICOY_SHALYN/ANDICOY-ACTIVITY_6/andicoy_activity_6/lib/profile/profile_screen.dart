import 'package:andicoy_activity_6/profile/app_drawer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyProfileApp());
}

class MyProfileApp extends StatelessWidget {
  const MyProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  BoxDecoration _boxStyle() {
    return BoxDecoration(
      color: const Color.fromARGB(175, 255, 255, 255),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shalyn Andicoy'),
        centerTitle: false,
        backgroundColor: Colors.teal,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/profile.JPG'),
                ),
                const SizedBox(width: 16),
                const Text(
                  'Shalyn Andicoy',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: _boxStyle(),
              child: Column(
                children: const [
                  InfoRow(
                    icon: Icons.cake,
                    label: 'Birthdate',
                    data: 'December 03, 2005',
                  ),
                  const InfoRow(
                    icon: Icons.home,
                    label: 'Address',
                    data: 'Brgy. Dalid, alimodian, Iloilo',
                  ),
                  const InfoRow(
                    icon: Icons.email,
                    label: 'Email',
                    data: 'shalyn.andicoy@wvsu.edu.ph',
                  ),
                  const InfoRow(
                    icon: Icons.phone,
                    label: 'Phone',
                    data: '09641918787',
                  ),
                  const InfoRow(
                    icon: Icons.school,
                    label: 'Education',
                    data: 'West Visayas State University',
                  ),
                  const InfoRow(
                    icon: Icons.book,
                    label: 'Course',
                    data: 'Bachelor of Science in Computer Science',
                  ),
                  const InfoRow(
                    icon: Icons.favorite,
                    label: 'Hobbies',
                    data: 'Playing Volleyball, Dancing, Watching K-dramas, Scrolling through my phone, Chilling in Nature',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: _boxStyle(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'My Biography',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Ever since I was young, I have always been a curious person, which is why I love doing exciting things like climbing trees and exploring activities that make me feel alive. '
                    'As an extrovert, I enjoy socializing and connecting with people, finding energy in conversations and shared experiences. '
                    'I am currently a second-year Computer Science student, striving to do my best in my studies while also embracing life outside the classroom. '
                    'My free time is filled with playing volleyball, engaging in outdoor adventures, and appreciating the beauty of nature, which I consider the best source of peace and inspiration. '
                    'While I thrive in the outdoors, I also value my personal time, where I indulge in watching K‑dramas and occasionally scrolling through my phone to unwind..',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String data;

  const InfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: Colors.teal),
          const SizedBox(width: 12),
          Text(
            '$label:',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              data,
              style: const TextStyle(color: Colors.black87),
              overflow: TextOverflow.visible,
            ),
          )
        ],
      ),
    );
  }
}