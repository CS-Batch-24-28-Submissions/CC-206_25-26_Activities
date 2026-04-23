import 'package:flutter/material.dart';
import 'package:panes_cc206_unit6_assignment/widgets/header.dart';
import 'package:panes_cc206_unit6_assignment/widgets/information_row.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(title: "Althea Shane B. Panes"),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.orange,
                              width: 1.5,
                            ),
                            color: Colors.white,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/profile.jpg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Althea Shane B. Panes",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    _buildSectionCard(
                      child: Column(
                        children: [
                          InformationRow(
                            icon: Icons.cake,
                            label: "Birthdate",
                            data: "April 22, 2006",
                          ),
                          InformationRow(
                            icon: Icons.home,
                            label: "Address",
                            data: "San Enrique, Iloilo",
                          ),
                          InformationRow(
                            icon: Icons.email,
                            label: "Email",
                            data: "altheashane.panes@wvsu.edu.ph",
                          ),
                          InformationRow(
                            icon: Icons.phone,
                            label: "Phone Number",
                            data: "09930693716",
                          ),
                          InformationRow(
                            icon: Icons.school,
                            label: "Education",
                            data: "West Visayas State University",
                          ),
                          InformationRow(
                            icon: Icons.book,
                            label: "Course",
                            data: "BS Computer Science",
                          ),
                          InformationRow(
                            icon: Icons.favorite,
                            label: "Hobbies",
                            data:
                                "Cafe-hopping, Motorcycling, Sleeping, Taking Pictures, and Binge-watching K-drama series.",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    //Biography
                    _buildSectionCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "My Biography",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            """I grew up in San Enrique, Iloilo, a place that helped me appreciate quiet moments and the simple joy of exploring new places. I enjoy spending time at home to rest and reflect, but I also like traveling and experiencing unfamiliar environments whenever I can. Taking pictures is one of my favorite ways to keep memories, capturing small but meaningful moments along the way. As the youngest among three siblings—now two after the passing of our eldest when I was just two years old—I was shaped by that experience to value resilience and the importance of family, and I have come to value my family and friends deeply. Although I was not originally inclined toward technology, I found myself applying for a Computer Science program without fully knowing what to expect, and over time, I became curious and slowly learned to embrace it. I know I still have much to learn, and I continue to move forward with curiosity, openness, and a willingness to grow step by step.""",
                            style: TextStyle(fontSize: 15, height: 1.75),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Card Styling
  Widget _buildSectionCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}
