import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Georgia', 
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [const ProfileScreen(), const PetScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(30, 0, 30, 30),
        child: BubbleGlass(
          radius: 40,
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index),
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white30,
            selectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.style_outlined), label: 'Profile'),
              BottomNavigationBarItem(icon: Icon(Icons.auto_awesome_outlined), label: 'Ponyo'),
            ],
          ),
        ),
      ),
    );
  }
}

class BubbleGlass extends StatelessWidget {
  final Widget child;
  final double radius;
  const BubbleGlass({super.key, required this.child, this.radius = 30});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(
              color: Colors.white.withOpacity(0.35),
              width: 1.5,
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.25),
                Colors.white.withOpacity(0.05),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
              )
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}

class GlassCard extends StatelessWidget {
  final Widget child;
  final String? title;
  const GlassCard({super.key, required this.child, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
              title!, 
              style: const TextStyle(
                fontSize: 13, 
                fontWeight: FontWeight.w900, 
                color: Colors.white, 
                letterSpacing: 3.0,
              )
            ),
          ),
        BubbleGlass(
          radius: 35,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: child,
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}

class BackgroundLayout extends StatelessWidget {
  final Widget child;
  const BackgroundLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFFF06292), Color(0xFFCE93D8), Color(0xFF7E57C2)],
        ),
      ),
      child: SafeArea(child: SingleChildScrollView(physics: const BouncingScrollPhysics(), child: child)),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            const SizedBox(height: 60), 
            Text(
              "Get to Know Elaijah!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 36, 
                fontWeight: FontWeight.w900, 
                fontStyle: FontStyle.italic, 
                color: Colors.white, 
                letterSpacing: 1.2,
                shadows: [
                  Shadow(blurRadius: 15.0, color: Colors.black.withOpacity(0.3), offset: const Offset(2.0, 4.0)),
                ],
              ),
            ),
            const SizedBox(height: 45),
            
            GlassCard(
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.2), blurRadius: 10)]
                    ),
                    child: const CircleAvatar(
                      radius: 38,
                      backgroundImage: AssetImage('assets/profile.png'),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Elaijah A. Aman", 
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: -0.5)
                      ),
                      Text(
                        "BS in Computer Science", 
                        style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 14, fontFamily: 'sans-serif', fontWeight: FontWeight.w600)
                      ),
                    ],
                  ),
                ],
              ),
            ),

            GlassCard(
              title: "CONNECT",
              child: Column(
                children: [
                  _labeledInfoTile(Icons.alternate_email_rounded, "Email", "elaijah.aman@wvsu.edu.ph"),
                  const Divider(color: Colors.white30, height: 25),
                  _labeledInfoTile(Icons.push_pin_outlined, "Address", "Banica, Roxas City, Capiz"),
                  const Divider(color: Colors.white30, height: 25),
                  _labeledInfoTile(Icons.phone_android_outlined, "Contact Number", "09934861101"),
                ],
              ),
            ),

            GlassCard(
              title: "HOBBIES",
              child: Column(
                children: [
                  _labeledInfoTile(Icons.auto_awesome_outlined, "Dancing", "Expression through movement"),
                  const Divider(color: Colors.white30, height: 25),
                  _labeledInfoTile(Icons.restaurant_rounded, "Eating", "Exploring various cuisines"),
                  const Divider(color: Colors.white30, height: 25),
                  _labeledInfoTile(Icons.videogame_asset_outlined, "Gaming", "Competitive & RPG titles"),
                ],
              ),
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }

  Widget _labeledInfoTile(IconData icon, String label, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 22),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(color: Colors.white70, fontSize: 11, fontWeight: FontWeight.w900, fontFamily: 'sans-serif', letterSpacing: 1.0)),
              Text(text, style: const TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'sans-serif', fontWeight: FontWeight.w700)),
            ],
          )
        ),
      ],
    );
  }
}

class PetScreen extends StatefulWidget {
  const PetScreen({super.key});
  @override
  State<PetScreen> createState() => _PetScreenState();
}

class _PetScreenState extends State<PetScreen> {
  final AudioPlayer _player = AudioPlayer();

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Text(
              "Pet Companion", 
              style: TextStyle(
                fontSize: 36, 
                fontWeight: FontWeight.w900, 
                fontStyle: FontStyle.italic, 
                color: Colors.white,
                shadows: [Shadow(blurRadius: 15.0, color: Colors.black.withOpacity(0.3), offset: const Offset(2.0, 4.0))],
              )
            ),
            const SizedBox(height: 45),
            GlassCard(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset('assets/pet.png', height: 320, width: double.infinity, fit: BoxFit.cover),
                  ),
                  const SizedBox(height: 30),
                  const Text("Ponyo", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
                  const SizedBox(height: 35),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => _player.play(AssetSource('bark.mp3')),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.white, width: 2),
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                          ),
                          child: const Text("PLAY", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => _player.stop(),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.white, width: 2),
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                          ),
                          child: const Text("STOP", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
                        ),
                      ),
                    ],
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