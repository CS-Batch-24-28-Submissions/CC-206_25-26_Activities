import 'package:flutter/material.dart';

class Profile extends StatelessWidget{
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange.withValues(alpha: 0.7),
        title: const Text('Frandolph Joseph L. Guadalupe')
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle, // Use BoxShape.circle for a round image
                      image: DecorationImage(
                        image: AssetImage('assets/profile_picture.png'),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(color: Colors.deepOrange, width: 2), // Optional border
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Hi! My name is Frandolph.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Email Section
              _buildSection(Icons.email, 'Email', 'frandolphjoseph.gudalupe@wvsu.edu.ph'),
              
              // Birthdate Section
              _buildSection(Icons.calendar_today, 'Birthdate', 'March 19, 2006'),
              
              // Address Section
              _buildSection(Icons.location_on, 'Address', 'Poblacion, Batad, Iloilo'),
              
              // Education Section
              _buildSection(Icons.school, 'Education', 'West Visayas State University'),
              
              // Course Section
              _buildSection(Icons.book, 'Course', 'BS in Computer Science'),
              
              // Hobbies Section
              _buildSection(Icons.sports_esports, 'Hobbies', 'Listening to Music, Playing Games'),
              const SizedBox(height: 24),
              
              // Biography Section
              Text(
                'My Biography',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepOrange),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade50,
                ),
                child: const Text(
                  'Hi! I am Frandolph Joseph Guadalupe, an aspiring Software Engineer that loves to solve technical problems and provide creative solutions. I am currently taking Bachelor of Science in Computer Science at West Visayas State University. Most of my foundation came from almost 2 years of academic experince, where I learn to love what I do and at the same time criticize my own decisions. I am professional and a team-player when it comes to work, and it is my goal to prioritize the betterness of tomorrow.',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.6,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(IconData icon, String label, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.deepOrange),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.deepOrange, size: 20),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.deepOrange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

