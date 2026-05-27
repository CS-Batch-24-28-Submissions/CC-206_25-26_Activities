import 'package:flutter/material.dart';

import 'pet_sound_player.dart';

void main() {
  runApp(const MyApp());
}

const StudentProfile studentProfile = StudentProfile(
  fullName: 'Karlo Antonio V. Penaranda',
  headline: 'Computer Science Student',
  birthdate: '03/14/2006',
  address: 'Roxas City',
  email: 'Penarandakarloantonio@gmail.com',
  phone: '09627409641',
  education: 'West Visayas State University',
  course: 'Bachelor of Science in Computer Science',
  hobbies: 'Working out',
  biography:
      'I am Karlo Antonio V. Penaranda, a Bachelor of Science in Computer Science student at West Visayas State University. I come from Roxas City and enjoy working out because it helps me stay disciplined, focused, and motivated. As a student, I want to keep improving my knowledge in technology while building habits that help me become healthier, more confident, and ready for future opportunities.',
);

class StudentProfile {
  const StudentProfile({
    required this.fullName,
    required this.headline,
    required this.birthdate,
    required this.address,
    required this.email,
    required this.phone,
    required this.education,
    required this.course,
    required this.hobbies,
    required this.biography,
  });

  final String fullName;
  final String headline;
  final String birthdate;
  final String address;
  final String email;
  final String phone;
  final String education;
  final String course;
  final String hobbies;
  final String biography;
}

class ProfileDetail {
  const ProfileDetail({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color seedColor = Color(0xFF0E6E6B);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Activity 6 Profile App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF6F4EF),
        appBarTheme: const AppBarTheme(
          backgroundColor: seedColor,
          foregroundColor: Colors.white,
          centerTitle: false,
          elevation: 0,
        ),
        navigationBarTheme: NavigationBarThemeData(
          indicatorColor: seedColor.withValues(alpha: 0.16),
          labelTextStyle: WidgetStateProperty.all(
            const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        useMaterial3: true,
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[HomeScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    final String title = _selectedIndex == 0
        ? 'My Pet'
        : studentProfile.fullName;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() => _selectedIndex = index);
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.pets_outlined),
            selectedIcon: Icon(Icons.pets),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _playPetSound() async {
    await playDogBark();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      'assets/images/ganda_photo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Ganda',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: const Color(0xFF1F2933),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'My Dog',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: const Color(0xFF5C6670),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 64,
                  child: FilledButton.icon(
                    onPressed: _playPetSound,
                    icon: const Icon(Icons.volume_up),
                    label: const Text(
                      'Play Bark',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    style: FilledButton.styleFrom(
                      backgroundColor: colors.primary,
                      foregroundColor: colors.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  List<ProfileDetail> get _details => <ProfileDetail>[
    ProfileDetail(
      icon: Icons.cake_outlined,
      label: 'Birthdate',
      value: studentProfile.birthdate,
    ),
    ProfileDetail(
      icon: Icons.home_outlined,
      label: 'Address',
      value: studentProfile.address,
    ),
    ProfileDetail(
      icon: Icons.email_outlined,
      label: 'Email',
      value: studentProfile.email,
    ),
    ProfileDetail(
      icon: Icons.phone_android_outlined,
      label: 'Phone Number',
      value: studentProfile.phone,
    ),
    ProfileDetail(
      icon: Icons.school_outlined,
      label: 'Education',
      value: studentProfile.education,
    ),
    ProfileDetail(
      icon: Icons.menu_book_outlined,
      label: 'Course',
      value: studentProfile.course,
    ),
    ProfileDetail(
      icon: Icons.favorite_outline,
      label: 'Hobbies',
      value: studentProfile.hobbies,
    ),
    const ProfileDetail(
      icon: Icons.pets_outlined,
      label: 'Pet',
      value: 'Ganda (Dog)',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 920),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const ProfileHeader(),
                const SizedBox(height: 20),
                ..._details.map(
                  (ProfileDetail detail) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: DetailRow(detail: detail),
                  ),
                ),
                const SizedBox(height: 8),
                const BiographySection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE4DED1)),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 3,
              ),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/profile_photo.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  studentProfile.fullName,
                  style: textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFF1F2933),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  studentProfile.headline,
                  style: textTheme.bodyLarge?.copyWith(
                    color: const Color(0xFF5C6670),
                    fontWeight: FontWeight.w600,
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

class DetailRow extends StatelessWidget {
  const DetailRow({super.key, required this.detail});

  final ProfileDetail detail;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE4DED1)),
      ),
      child: Row(
        children: <Widget>[
          Icon(detail.icon, color: colors.primary, size: 26),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: Text(
              detail.label,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                color: Color(0xFF24303A),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              detail.value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Color(0xFF48525C),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BiographySection extends StatelessWidget {
  const BiographySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFCF6),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE4DED1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'My Biography',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
              color: const Color(0xFF1F2933),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            studentProfile.biography,
            style: const TextStyle(
              height: 1.45,
              color: Color(0xFF48525C),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
