import 'package:flutter/material.dart';
import '../widgets/info_row.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

/// This is the main build method for the ProfileScreen, which contains a header, profile card, info card, and about me section. 
/// It uses SingleChildScrollView to allow scrolling if content overflows.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header box
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 247, 129, 11), 
                    Color.fromARGB(255, 255, 200, 100), 
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.center,
                    child: Text(
                      "Jan Dennis Jinon Dariagan",
                        style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ), 
            const SizedBox(height: 24),

            /// This is the profile card section, which contains a circular avatar, name, and greeting. 
            /// It is styled with a Card widget for elevation and padding.
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48), 
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 80,
                          backgroundImage: AssetImage("assets/images/dariagan_image.jpg"),
                        ),
                        const SizedBox(width: 20),
                        Container(width: 2, height: 120, color: Colors.orange),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "MAAYONG ADLAW!",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 1),
                              Text(
                                "Jan Dennis Jinon Dariagan",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

          const SizedBox(height: 24),

          /// This is the info card section, which displays various pieces of information about the profile using the InfoRow widget.
          /// Each InfoRow consists of an icon, label, and data, and they are separated by Dividers for clarity.
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      InfoRow(icon: Icons.email, label: "Email", data: "jandennis.dariagan@wvsu.edu.ph"),
                      Divider(),
                      InfoRow(icon: Icons.school, label: "School", data: "West Visayas State University"),
                      Divider(),
                      InfoRow(icon: Icons.cake, label: "Age", data: "20 years old"),
                      Divider(),
                      InfoRow(icon: Icons.location_on, label: "Location", data: "Brgy. San Roque, Jaro, Iloilo City"),
                      Divider(),
                      InfoRow(icon: Icons.calendar_today, label: "Date of Birth", data: "November 5, 2005"),
                      Divider(),
                      InfoRow(icon: Icons.phone, label: "Phone Number", data: "0995-061-3577"),
                      Divider(),
                      InfoRow(icon: Icons.book, label: "Course", data: "BS Computer Science"),
                      Divider(),
                      InfoRow(icon: Icons.favorite, label: "Hobbies", data: "Studying, Sleeping, Coding"),
                      Divider(),
                      InfoRow(icon: Icons.info, label: "Status", data: "Active Student"),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          /// This is the about me section, which contains a card with a header and a detailed description about the profile.
          /// The text is justified for better readability, and the card is styled similarly to the previous sections for consistency.
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "GET TO KNOW JAJA!",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "I am Jan Dennis J. Dariagan, also called by my friends as Jaja, a 2nd-year Bachelor of Science in Computer Science student at West Visayas State University. "
                          "I am the second child in my family, with an older brother named Deric John Dariagan. My parents, Dennis and Joy Dariagan, have been my pillars of support throughout my academic journey. "
                          "I completed my elementary education at Jaro I Elementary School and my high school education at Iloilo National High School. "
                          "Aside from academics, I am a passionate youth leader and an active member of the Jaro Parish Youth Ministry. I have been serving as the Youth Ministry President for the past year and a half, where I have organized various events and activities to engage and empower the youth in our parish community. "
                          "I also love dancing, acting, watching movies, spending time with friends, reading, and improving my technical and communication skills. "
                          "I am excited to continue my journey in the field of computer science and contribute to the ever-evolving world of technology.",
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}


