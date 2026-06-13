//flutter portfolio
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pet.dart';

void main() {
  runApp(const MyApp());
}

class SkunkColors {
  static const Color black = Color(0xFF08090A);
  static const Color lightGray = Color(0xFFA7A2A9);
  static const Color whiteGray = Color(0xFFF4F7F5);
  static const Color mediumGray = Color(0xFF575A5E);
  static const Color darkGray = Color(0xFF1E2124);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Ryuske\'s Portfolio',
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
      ),
      home: const MyHomePage(title: 'Ryuske\'s Skunk Portfolio'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SkunkColors.black,
      appBar: AppBar(
        backgroundColor: SkunkColors.mediumGray,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.title,
          //google font
          style: const TextStyle(
            color: SkunkColors.whiteGray,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile Section
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: SkunkColors.whiteGray.withOpacity(0.2),
                        width: 4,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: SkunkColors.darkGray,
                      backgroundImage: AssetImage('assets/profile.png'),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ryuske Sendo',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: SkunkColors.whiteGray,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'Full Time Skunk',
                        style: const TextStyle(
                          fontSize: 16,
                          color: SkunkColors.lightGray,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow(Icons.email, 'Email', 'ryuskesendo@pogi.com'),
                    _buildInfoRow(
                      Icons.school,
                      'School',
                      'West Visayas State University',
                    ),
                    _buildInfoRow(
                      Icons.school,
                      'Course',
                      'BS Computer Science',
                    ),
                    _buildInfoRow(
                      Icons.local_activity,
                      'Hobbies',
                      'Eating, Gaming, Gundam, Programming',
                    ),
                    _buildInfoRow(
                      Icons.food_bank,
                      'Favorite Foods',
                      'J\'s Burger, Mountain Dew, Shawarma, Rice',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 250,
                height: 250,
                child: Image.asset('assets/whoisthis.png'),
              ),
              //Biography
              Container(
                width: 400,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 18,
                ),
                decoration: BoxDecoration(
                  color: SkunkColors.darkGray,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: SkunkColors.whiteGray.withOpacity(0.05),
                  ),
                ),
                child: Text(
                  'I\'m a second year BSCS student studying at West Visayas State University. I am a fan of Gundam and watching films. When I asked a serious question on what animal represents me, someone answered Skunk. Therefore the theme of this profile is skunk themed. Regardless of the societal views on skunks, I think they are pretty cool. I hope you do too.',
                  style: const TextStyle(
                    fontSize: 16,
                    color: SkunkColors.whiteGray,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        // Move the onTap logic here
        onTap: (int index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PetPage()),
            );
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Pet'),
        ],
        backgroundColor: SkunkColors.mediumGray,
        selectedItemColor: SkunkColors.whiteGray,
        unselectedItemColor: SkunkColors.lightGray,
      ),
    );
  }
}

//helper
Widget _buildInfoRow(IconData icon, String title, String description) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 20),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
    width: 400,
    decoration: BoxDecoration(
      color: SkunkColors.darkGray,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: SkunkColors.whiteGray.withOpacity(0.05)),
    ),
    child: Row(
      children: [
        Icon(icon, color: SkunkColors.lightGray, size: 30),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title.toUpperCase(),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: SkunkColors.mediumGray,
                  letterSpacing: 1.5,
                ),
              ),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: SkunkColors.whiteGray,
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
