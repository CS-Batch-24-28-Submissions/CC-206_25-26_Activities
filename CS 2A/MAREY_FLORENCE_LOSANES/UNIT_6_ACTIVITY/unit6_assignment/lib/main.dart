// main.dart
// FULL CLEAN VERSION — COPY & PASTE READY

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marey Florence Losanes',
      theme: ThemeData(
        fontFamily: 'Arial',
      ),
      home: const MainNavigation(),
    );
  }
}

//
// MAIN NAVIGATION
//
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const ProfileScreen(),
    const PetScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: const Color(0xffE91E63),
        unselectedItemColor: Colors.pink.shade200,
        backgroundColor: const Color(0xffC92C67),
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 32),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets, size: 32),
            label: 'Pet',
          ),
        ],
      ),
    );
  }
}

//
// PROFILE SCREEN
//
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final PageController pageController = PageController();

  int currentPage = 0;

  final List<String> hobbyImages = [
    "assets/images/volunteer.png",
    "assets/images/sleep.png",
    "assets/images/series.png",
  ];

  Future<void> openSpotify() async {
    final Uri url = Uri.parse(
      'https://open.spotify.com/artist/61nn6nOoLWjVC1ER2qFAvN?si=yqXgL-1jTeyNtCCa9Vs4mw',
    );

    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  void nextImage() {
    if (currentPage < hobbyImages.length - 1) {
      currentPage++;
    } else {
      currentPage = 0;
    }

    pageController.animateToPage(
      currentPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffF85CA8),
              Color(0xffFF8BC2),
              Color(0xffFFD2E7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  const SizedBox(height: 10),

                  //
                  // HEADER TITLE
                  //
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 18,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffD81B60),
                      borderRadius:
                          BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        "MAREY FLORENCE LOSANES",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  //
                  // PROFILE HEADER
                  //
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.25),
                      borderRadius:
                          BorderRadius.circular(35),
                    ),
                    child: Row(
                      children: [
                        // PROFILE PHOTO
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(
                                  25),
                          child: Image.asset(
                            "assets/images/profile.png",
                            width: 180,
                            height: 240,
                            fit: BoxFit.cover,
                          ),
                        ),

                        const SizedBox(width: 25),

                        // NAME
                        const Expanded(
                          child: Center(
                            child: Text(
                              "Marey Florence\nLosanes",
                              textAlign:
                                  TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 38,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  //
                  // BIRTHDAY
                  //
                  infoTile(
                    icon:
                        "assets/images/bday.png",
                    title: "Birthday",
                    subtitle:
                        "November 9, 2005",
                  ),

                  //
                  // EMAIL
                  //
                  infoTile(
                    icon:
                        "assets/images/email.png",
                    title: "Email",
                    subtitle:
                        "mareyflorence.losanes@wvsu.edu.ph",
                  ),

                  //
                  // FAVORITE ARTIST
                  //
                  GestureDetector(
                    onTap: openSpotify,
                    child: infoTile(
                      icon:
                          "assets/images/fav artists.png",
                      title:
                          "Favourite Artist",
                      subtitle:
                          "Cup of Joe (Tap to Open Spotify)",
                    ),
                  ),

                  const SizedBox(height: 30),

                  //
                  // HOBBIES
                  //
                  Container(
                    padding:
                        const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color:
                          Colors.white.withOpacity(
                              .25),
                      borderRadius:
                          BorderRadius.circular(
                              35),
                    ),
                    child: Column(
                      children: [
                        const Align(
                          alignment:
                              Alignment.centerLeft,
                          child: Text(
                            "Hobbies",
                            style: TextStyle(
                              color:
                                  Colors.white,
                              fontSize: 26,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(
                            height: 20),

                        SizedBox(
                          height: 420,
                          child: Stack(
                            children: [
                              PageView.builder(
                                controller: pageController,
                                itemCount: hobbyImages.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(35),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(35),
                                      child: InteractiveViewer(
                                        panEnabled: false,
                                        scaleEnabled: false,
                                        child: Center(
                                        child: AspectRatio(
                                          aspectRatio: 1.0,
                                          child:Image.asset(
                                            hobbyImages[index],
                                            fit: BoxFit.contain,
                                        )
                                        ),
                                      ),
                                    ),
                                    )
                                  );
                                },
                              ),
                              Positioned(
                                right: 15,
                                top: 175,
                                child: GestureDetector(
                                  onTap: nextImage,
                                  child: Container(
                                    width: 65,
                                    height: 65,
                                    decoration: const BoxDecoration(
                                      color: Color(0xffD81B60),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                                    const SizedBox(height: 30),

                  //
                  // GET TO KNOW ME
                  //
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.25),
                      borderRadius:
                          BorderRadius.circular(35),
                    ),
                    child: const Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Get to Know Me",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 15),

                        Text(
                          "I am a second-year Computer Science student from West Visayas State University with a passion for innovation, storytelling, and service. I have experience in leadership, event management, public relations, and creative production through my work in student organizations and volunteer communities.\n\n"
                          "Beyond academics, I actively participate in youth leadership programs, humanitarian initiatives, and technology-driven projects that aim to create positive social impact.\n\n"
                          "I believe that creativity and technology become more powerful when used to help communities grow.",
                          textAlign:
                              TextAlign.justify,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            height: 1.6,
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
    );
  }

  //
  // BIG ICON TILE
  //
  Widget infoTile({
    required String icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.25),
        borderRadius:
            BorderRadius.circular(35),
      ),
      child: Row(
        children: [
          //
          // BIG PINK ICON
          //
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              color: Color(0xFFFFFFFF),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(18),
            child: Image.asset(
              icon,
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(width: 22),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//
// PET SCREEN
//
class PetScreen extends StatefulWidget {
  const PetScreen({super.key});

  @override
  State<PetScreen> createState() =>
      _PetScreenState();
}

class _PetScreenState
    extends State<PetScreen> {
  final AudioPlayer player =
      AudioPlayer();

  Future<void> playBark() async {
    await player.play(
      AssetSource("audio/bark.mp3"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffF85CA8),
              Color(0xffFF8BC2),
              Color(0xffFFD2E7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.all(25),
              child: Column(
                children: [
                  const SizedBox(
                      height: 20),

                  //
                  // TITLE
                  //
                  Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets
                            .symmetric(
                      vertical: 18,
                    ),
                    decoration:
                        BoxDecoration(
                      color: const Color(
                          0xffD81B60),
                      borderRadius:
                          BorderRadius
                              .circular(
                                  20),
                    ),
                    child:
                        const Center(
                      child: Text(
                        "MY PET CADEN",
                        style:
                            TextStyle(
                          color: Colors
                              .white,
                          fontSize:
                              26,
                          fontWeight:
                              FontWeight
                                  .bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                      height: 25),

                  //
                  // ME & CADEN
                  //
                  Container(
                    padding:
                        const EdgeInsets
                            .all(10),
                    decoration:
                        BoxDecoration(
                      color: const Color(
                          0xffC2185B),
                      borderRadius:
                          BorderRadius
                              .circular(
                                  35),
                    ),
                    child:
                        ClipRRect(
                      borderRadius:
                          BorderRadius
                              .circular(
                                  25),
                      child:
                          Image.asset(
                        "assets/images/me and caden.png",
                        height:
                            280,
                        fit: BoxFit
                            .cover,
                      ),
                    ),
                  ),

                  const SizedBox(
                      height: 35),

                  const Text(
                    "Pet me, I'll bark 🐶",
                    style: TextStyle(
                      color:
                          Colors.white,
                      fontSize: 30,
                      fontWeight:
                          FontWeight
                              .bold,
                    ),
                  ),

                  const SizedBox(
                      height: 25),

                  //
                  // PET CADEN
                  //
                  MouseRegion(
                    onHover: (_) {
                      playBark();
                    },
                    child:
                        Container(
                      padding:
                          const EdgeInsets
                              .all(10),
                      decoration:
                          BoxDecoration(
                        color:
                            const Color(
                                0xffC2185B),
                        borderRadius:
                            BorderRadius.circular(
                                35),
                      ),
                      child:
                          ClipRRect(
                        borderRadius:
                            BorderRadius.circular(
                                25),
                        child:
                            Image.asset(
                          "assets/images/pet caden.png",
                          height:
                              320,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}