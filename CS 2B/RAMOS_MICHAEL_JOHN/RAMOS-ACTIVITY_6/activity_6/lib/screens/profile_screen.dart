import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MICHAEL JOHN D. RAMOS'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 35, 38, 41),
              Color.fromARGB(255, 40, 40, 44),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              // --- Profile Hero Card ---
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 21, 0, 166),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [

                    // Profile picture on the left
                    CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          const AssetImage('assets/images/profile.png'),
                    ),

                    const SizedBox(width: 16),

                    // Name, course, location on the right
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Michael John D. Ramos',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'BS Computer Science',
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(130, 89, 40, 222),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Iloilo City, Philippines',
                              style: TextStyle(
                                color: Color.fromARGB(255, 210, 195, 255),
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 12),

              // --- Info Group Card ---
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(14, 10, 14, 4),
                      child: Text(
                        'ABOUT ME',
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: 10,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                    _infoTile(
                      icon: Icons.email,
                      label: 'Email',
                      value: 'michaeljohn.ramos@wvsu.edu.ph',
                      showDivider: true,
                    ),
                    _infoTile(
                      icon: Icons.cake,
                      label: 'Birthday',
                      value: 'April 27, 2006',
                      showDivider: true,
                    ),
                    _infoTile(
                      icon: Icons.location_on,
                      label: 'Address',
                      value: 'Iloilo City, Philippines',
                      showDivider: true,
                    ),
                    _infoTile(
                      icon: Icons.sports_esports,
                      label: 'Hobbies',
                      value: 'Gaming, Reading, Coding, Drawing',
                      showDivider: true,
                    ),
                    _infoTile(
                      icon: Icons.school,
                      label: 'Course',
                      value: 'BS Computer Science',
                      showDivider: false,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // --- Bio Card ---
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'BIOGRAPHY',
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 10,
                        letterSpacing: 0.8,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Hi! I am Michael John D. Ramos, a passionate Computer Science student '
                      'from Iloilo City, Philippines. I enjoy solving problems through '
                      'code and love exploring new technologies. In my free time, I like '
                      'gaming, reading novels, and drawing. '
                      'I aspire to become a software engineer and contribute to '
                      'meaningful projects that make a difference in people\'s lives.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                        height: 1.6,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoTile({
    required IconData icon,
    required String label,
    required String value,
    required bool showDivider,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Row(
            children: [
              Icon(icon, color: Colors.deepPurple, size: 20),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white38,
                      fontSize: 10,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 242, 242, 255),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (showDivider)
          const Divider(
            height: 1,
            indent: 46,
            color: Color.fromARGB(30, 255, 255, 255),
          ),
      ],
    );
  }
}