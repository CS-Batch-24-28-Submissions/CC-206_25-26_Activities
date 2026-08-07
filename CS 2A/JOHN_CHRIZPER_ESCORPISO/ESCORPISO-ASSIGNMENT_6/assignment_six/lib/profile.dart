import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

//my comment to make small changes to confirm pull request

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _profileHeader(),
          const SizedBox(height: 7),
          _profileName(),
          const SizedBox(height: 7),
          _personalInfo(),
          const SizedBox(height: 19),
          _biography(),
          const SizedBox(height: 14),
        ],
      ),
    );
  }

  Widget _profileHeader() {
    return Container(
      height: 63,
      decoration: const BoxDecoration(color: Color(0xFF9CCC65)),
      padding: const EdgeInsets.all(10),
      child: const Row(
        children: [
          Text(
            'Profile',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _profileName() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Photo placeholder
          Container(
            width: 100,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'assets/pictures/profile.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(width: 14),

          // Name and title
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Chrizper D. Escorpiso',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                'Computer Science Student',
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _personalInfo() {
    final List<Map<String, dynamic>> infoItems = [
      {
        'label': 'EMAIL',
        'value': 'johnchrizper.escorpiso@wvsu.edu.ph',
        'letter': 'E',
        'color': Color(0xFFE8EAF6),
      },
      {
        'label': 'BIRTHDAY',
        'value': 'June 30, 2006',
        'letter': 'B',
        'color': Color(0xFFFCE4EC),
      },
      {
        'label': 'LOCATION',
        'value': 'Iloilo City, Philippines',
        'letter': 'L',
        'color': Color(0xFFE8F5E9),
      },
      {
        'label': 'COURSE',
        'value': 'BS Computer Science',
        'letter': 'C',
        'color': Color(0xFFFFFDE7),
      },
      {
        'label': 'HOBBIES',
        'value': 'Wandering, Reading, Coding',
        'letter': 'H',
        'color': Color(0xFFFCE4EC),
      },
      {
        'label': 'FAVORITE FOOD',
        'value': 'Balanghoy, Lechon',
        'letter': 'F',
        'color': Color(0xFFE0F2F1),
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 4, bottom: 8),
            child: Text(
              'PERSONAL INFO',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black45,
                letterSpacing: 1.2,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFC5E1A5),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: infoItems.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                final isLast = index == infoItems.length - 1;

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          // Letter icon
                          Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              color: item['color'],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                item['letter'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['label'],
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.black45,
                                  letterSpacing: 1.1,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                item['value'],
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (!isLast)
                      const Divider(
                        height: 1,
                        indent: 72,
                        endIndent: 16,
                        color: Colors.white,
                      ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _biography() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFC5E1A5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Biography',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Hi! I’m John Chrizper Escorpiso , a 19-year-old Computer Science student based in Iloilo, City. "
              "I grew up surrounded by books but developed a passion for software development at an early age. "
              "When I’m not writing code or studying my subjects, you’ll find me exploring local spots with my phone by my side, "
              "diving into science fiction movies, or getting lost in the worlds of my favorite video games. "
              "I believe in building technology that truly helps people and community, and I’m on a journey to turn that belief into reality — one project at a time.",
              style: TextStyle(fontSize: 14, height: 1.4),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
