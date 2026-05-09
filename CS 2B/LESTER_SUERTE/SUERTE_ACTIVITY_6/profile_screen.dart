import 'package:flutter/material.dart';
import '../widgets/info_row.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Profile Picture and Full Name
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      // Profile Picture with Asset Image
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: const AssetImage('assets/images/profile.jpg'),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        onBackgroundImageError: (exception, stackTrace) {},
                        child: const Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 20),
                      // Full Name
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Lester Gianne Suerte',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'BSCS Student',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // 2. Information Sections
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      InfoRow(
                        icon: Icons.school,
                        label: 'EDUCATION',
                        value: 'West Visayas State University',
                        iconColor: Colors.purple,
                      ),
                      const Divider(height: 24),
                      InfoRow(
                        icon: Icons.computer,
                        label: 'COURSE',
                        value: 'BSCS',
                        iconColor: Colors.blue,
                      ),
                      const Divider(height: 24),
                      InfoRow(
                        icon: Icons.email,
                        label: 'EMAIL',
                        value: 'lestergianne.suerte@wvsu.edu.ph',
                        iconColor: Colors.red,
                      ),
                      const Divider(height: 24),
                      InfoRow(
                        icon: Icons.phone,
                        label: 'PHONE',
                        value: '09104115378',
                        iconColor: Colors.green,
                      ),
                      const Divider(height: 24),
                      InfoRow(
                        icon: Icons.location_on,
                        label: 'ADDRESS',
                        value: 'Baclayan, New Lucena, Iloilo',
                        iconColor: Colors.orange,
                      ),
                      const Divider(height: 24),
                      InfoRow(
                        icon: Icons.cake,
                        label: 'BIRTHDAY',
                        value: 'September 22, 2005',
                        iconColor: Colors.pink,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // 3. Biography Section
              Card(
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
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'My Biography',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'My name is Lester Gianne Suerte, born on September 22, 2005. I am currently pursuing a Bachelor of Science in Computer Science (BSCS) at West Visayas State University. I live in Baclayan, New Lucena, Iloilo, and I like to learn about in the field of technology and software development.',
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.6,
                          color: Colors.grey[800],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}