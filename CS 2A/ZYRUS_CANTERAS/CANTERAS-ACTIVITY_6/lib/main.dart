import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Unit6App());
}

const Color _ink = Color(0xFF17212B);
const Color _teal = Color(0xFF0E7C7B);
const Color _coral = Color(0xFFE76F51);
const Color _gold = Color(0xFFF4C430);
const Color _paper = Color(0xFFF6F8FA);
const Color _line = Color(0xFFDDE5EA);

class Unit6App extends StatelessWidget {
  const Unit6App({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _teal,
      brightness: Brightness.light,
    ).copyWith(
      primary: _teal,
      secondary: _coral,
      tertiary: _gold,
      surface: Colors.white,
    );

    return MaterialApp(
      title: 'Unit 6 Assignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: colorScheme,
        scaffoldBackgroundColor: _paper,
        textTheme: ThemeData.light().textTheme.apply(
              bodyColor: _ink,
              displayColor: _ink,
            ),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SiteHeader(),
              Expanded(
                child: TabBarView(
                  children: [
                    ProfileScreen(),
                    PetScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SiteHeader extends StatelessWidget {
  const SiteHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 720;
        final titleBlock = Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: _gold,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.dashboard_customize_rounded,
                color: _ink,
              ),
            ),
            const SizedBox(width: 14),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Student Profile Hub',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Profile and pet showcase',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xFFB9C8D2),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );

        final tabs = SizedBox(
          width: compact ? double.infinity : 320,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TabBar(
              dividerColor: Colors.transparent,
              indicatorPadding: const EdgeInsets.all(4),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              labelColor: _ink,
              unselectedLabelColor: Colors.white,
              labelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
              tabs: const [
                Tab(
                  height: 52,
                  icon: Icon(Icons.person_rounded),
                  text: 'Profile',
                ),
                Tab(
                  height: 52,
                  icon: Icon(Icons.pets_rounded),
                  text: 'Pet',
                ),
              ],
            ),
          ),
        );

        return Container(
          width: double.infinity,
          color: _ink,
          padding: EdgeInsets.fromLTRB(
            compact ? 16 : 32,
            compact ? 14 : 20,
            compact ? 16 : 32,
            compact ? 14 : 20,
          ),
          child: compact
              ? Column(
                  children: [
                    titleBlock,
                    const SizedBox(height: 14),
                    tabs,
                  ],
                )
              : Row(
                  children: [
                    Expanded(child: titleBlock),
                    const SizedBox(width: 24),
                    tabs,
                  ],
                ),
        );
      },
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const List<ProfileDetail> details = [
    ProfileDetail(
      icon: Icons.email_rounded,
      label: 'Email',
      value: 'zyruschristian.canteras@wvsu.edu.ph',
    ),
    ProfileDetail(
      icon: Icons.cake_rounded,
      label: 'Birthday',
      value: 'October 4, 2005',
    ),
    ProfileDetail(
      icon: Icons.school_rounded,
      label: 'Course',
      value: 'BS Computer Science',
    ),
    ProfileDetail(
      icon: Icons.calendar_month_rounded,
      label: 'Year Level',
      value: '2nd Year',
    ),
    ProfileDetail(
      icon: Icons.account_balance_rounded,
      label: 'School',
      value: 'West Visayas State University',
    ),
    ProfileDetail(
      icon: Icons.favorite_rounded,
      label: 'Hobbies',
      value: 'Studying, Coding, Sleeping',
    ),
    ProfileDetail(
      icon: Icons.location_on_rounded,
      label: 'Address',
      value: 'Iloilo City, Philippines',
    ),
  ];

  static const List<FocusArea> focusAreas = [
    FocusArea(
      icon: Icons.storefront_rounded,
      title: 'Entrepreneurship',
      description:
          'Learning how innovative ideas can become useful products, services, and sustainable businesses.',
    ),
    FocusArea(
      icon: Icons.view_in_ar_rounded,
      title: 'Extended Reality',
      description:
          'Exploring augmented, virtual, and mixed reality experiences that connect digital content with the real world.',
    ),
    FocusArea(
      icon: Icons.smart_toy_rounded,
      title: 'Robotics',
      description:
          'Understanding automation, sensors, and intelligent machines that can solve practical problems.',
    ),
    FocusArea(
      icon: Icons.psychology_rounded,
      title: 'Artificial Intelligence',
      description:
          'Studying intelligent systems that support automation, decision-making, and creative innovation.',
    ),
    FocusArea(
      icon: Icons.hub_rounded,
      title: 'Smart Technology',
      description:
          'Connecting software, devices, and data through the Internet of Things and other emerging technologies.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ContentFrame(
      children: [
        const ProfileHero(),
        const SizedBox(height: 24),
        const SectionTitle(
          title: 'Personal Details',
          subtitle: 'Quick information from the profile activity.',
        ),
        const SizedBox(height: 12),
        DetailsGrid(details: details),
        const SizedBox(height: 24),
        const BiographySection(),
        const SizedBox(height: 24),
        const SectionTitle(
          title: 'Learning Focus',
          subtitle:
              'Interests in business, immersive experiences, intelligent machines, and emerging technology.',
        ),
        const SizedBox(height: 12),
        FocusGrid(items: focusAreas),
      ],
    );
  }
}

class ProfileHero extends StatelessWidget {
  const ProfileHero({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 760;
        final image = ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/images/profile.jpg',
            width: compact ? 132 : 168,
            height: compact ? 132 : 168,
            fit: BoxFit.cover,
          ),
        );

        final details = Column(
          crossAxisAlignment:
              compact ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            Text(
              'Zyrus Christian E. Canteras',
              textAlign: compact ? TextAlign.center : TextAlign.left,
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              '2nd Year BS Computer Science student at West Visayas State University.',
              textAlign: compact ? TextAlign.center : TextAlign.left,
              style: const TextStyle(
                color: Color(0xFFD7E1E8),
                fontSize: 16,
                height: 1.45,
              ),
            ),
            const SizedBox(height: 18),
            Wrap(
              alignment: compact ? WrapAlignment.center : WrapAlignment.start,
              spacing: 10,
              runSpacing: 10,
              children: const [
                ProfileMarker(
                  icon: Icons.school_rounded,
                  label: '2nd Year',
                  color: _gold,
                ),
                ProfileMarker(
                  icon: Icons.code_rounded,
                  label: 'Developer',
                  color: _teal,
                ),
                ProfileMarker(
                  icon: Icons.storefront_rounded,
                  label: 'Entrepreneur',
                  color: _gold,
                ),
                ProfileMarker(
                  icon: Icons.location_on_rounded,
                  label: 'Iloilo City',
                  color: _coral,
                ),
              ],
            ),
          ],
        );

        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(compact ? 18 : 28),
          decoration: BoxDecoration(
            color: _ink,
            borderRadius: BorderRadius.circular(8),
          ),
          child: compact
              ? Column(
                  children: [
                    image,
                    const SizedBox(height: 20),
                    details,
                  ],
                )
              : Row(
                  children: [
                    image,
                    const SizedBox(width: 28),
                    Expanded(child: details),
                  ],
                ),
        );
      },
    );
  }
}

class ProfileMarker extends StatefulWidget {
  final IconData icon;
  final String label;
  final Color color;

  const ProfileMarker({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  State<ProfileMarker> createState() => _ProfileMarkerState();
}

class _ProfileMarkerState extends State<ProfileMarker> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, isHovered ? -4 : 0, 0),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isHovered
              ? widget.color.withValues(alpha: 0.20)
              : Colors.white.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isHovered
                ? widget.color.withValues(alpha: 0.85)
                : Colors.white.withValues(alpha: 0.14),
          ),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: widget.color.withValues(alpha: 0.24),
                    blurRadius: 14,
                    offset: const Offset(0, 6),
                  ),
                ]
              : const [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.icon, size: 18, color: widget.color),
            const SizedBox(width: 8),
            Text(
              widget.label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsGrid extends StatelessWidget {
  final List<ProfileDetail> details;

  const DetailsGrid({
    super.key,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth >= 720 ? 2 : 1;
        const spacing = 12.0;
        final itemWidth =
            (constraints.maxWidth - (spacing * (columns - 1))) / columns;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: details
              .map(
                (detail) => SizedBox(
                  width: itemWidth,
                  child: ProfileDetailTile(detail: detail),
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class ProfileDetailTile extends StatelessWidget {
  final ProfileDetail detail;

  const ProfileDetailTile({
    super.key,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _line),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: _teal.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(detail.icon, color: _teal),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detail.label,
                  style: const TextStyle(
                    color: Color(0xFF667784),
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  detail.value,
                  style: const TextStyle(
                    color: _ink,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
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

class BiographySection extends StatelessWidget {
  const BiographySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _line),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.auto_stories_rounded, color: _coral),
              SizedBox(width: 10),
              Text(
                'My Biography',
                style: TextStyle(
                  color: _ink,
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            'I am a student of West Visayas State University learning about technological advancement in my time while allowing myself to partake in knowledge to improve my skills and understanding. I work in cars and real estate primarily as a novice working student and earning the experience. My goal is to become successful enough to create something innovative for the general public.',
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Color(0xFF41515E),
              fontSize: 16,
              height: 1.55,
            ),
          ),
        ],
      ),
    );
  }
}

class FocusGrid extends StatelessWidget {
  final List<FocusArea> items;

  const FocusGrid({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth >= 960
            ? 3
            : constraints.maxWidth >= 640
                ? 2
                : 1;
        const spacing = 12.0;
        final itemWidth =
            (constraints.maxWidth - (spacing * (columns - 1))) / columns;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: items
              .map(
                (item) => SizedBox(
                  width: itemWidth,
                  child: FocusTile(item: item),
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class FocusTile extends StatelessWidget {
  final FocusArea item;

  const FocusTile({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: _coral.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(item.icon, color: _coral),
          ),
          const SizedBox(height: 14),
          Text(
            item.title,
            style: const TextStyle(
              color: _ink,
              fontSize: 17,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.description,
            style: const TextStyle(
              color: Color(0xFF566774),
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }
}

class PetScreen extends StatefulWidget {
  const PetScreen({super.key});

  @override
  State<PetScreen> createState() => _PetScreenState();
}

class _PetScreenState extends State<PetScreen> {
  final AudioPlayer audioPlayer = AudioPlayer();
  late final StreamSubscription<PlayerState> playerStateSubscription;
  PlayerState playerState = PlayerState.stopped;

  @override
  void initState() {
    super.initState();
    playerStateSubscription = audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() => playerState = state);
      }
    });
  }

  Future<void> togglePetSound() async {
    if (playerState == PlayerState.playing) {
      await audioPlayer.pause();
    } else if (playerState == PlayerState.paused) {
      await audioPlayer.resume();
    } else {
      await audioPlayer.play(AssetSource('audio/pet_sound.mp3'));
    }
  }

  @override
  void dispose() {
    playerStateSubscription.cancel();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ContentFrame(
      children: [
        PetShowcase(
          isPlaying: playerState == PlayerState.playing,
          onToggleAudio: togglePetSound,
        ),
        const SizedBox(height: 24),
        const SectionTitle(
          title: 'Pet Details',
          subtitle:
              'A closer look at Kimchi, with a favorite photo and a playful sound.',
        ),
        const SizedBox(height: 12),
        const PetInfoGrid(),
      ],
    );
  }
}

class PetShowcase extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onToggleAudio;

  const PetShowcase({
    super.key,
    required this.isPlaying,
    required this.onToggleAudio,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 820;
        final image = ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: AspectRatio(
            aspectRatio: compact ? 4 / 3 : 1.16,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/pet.jpg',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Color(0xB3000000),
                      ],
                      stops: [0.55, 1],
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: _gold,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.pets_rounded, size: 16, color: _ink),
                        SizedBox(width: 6),
                        Text(
                          'PET SPOTLIGHT',
                          style: TextStyle(
                            color: _ink,
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  left: 18,
                  right: 18,
                  bottom: 16,
                  child: Text(
                    'Small paws, big personality.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

        final content = Padding(
          padding: EdgeInsets.all(compact ? 20 : 28),
          child: Column(
            crossAxisAlignment:
                compact ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: _gold,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.pets_rounded,
                  color: _ink,
                  size: 28,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                'Kimchi',
                textAlign: compact ? TextAlign.center : TextAlign.left,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Shih Tzu companion',
                style: TextStyle(
                  color: _gold,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.4,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                'My Shih Tzu companion with a photo moment and a sound button.',
                textAlign: compact ? TextAlign.center : TextAlign.left,
                style: const TextStyle(
                  color: Color(0xFFD7E1E8),
                  fontSize: 16,
                  height: 1.45,
                ),
              ),
              const Spacer(),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.12),
                  ),
                ),
                child: Row(
                  children: [
                    IconButton.filled(
                      onPressed: onToggleAudio,
                      tooltip: isPlaying ? 'Pause audio' : 'Play audio',
                      style: IconButton.styleFrom(
                        backgroundColor: _gold,
                        foregroundColor: _ink,
                      ),
                      iconSize: 28,
                      padding: const EdgeInsets.all(12),
                      icon: Icon(
                        isPlaying
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isPlaying ? 'Now playing' : 'Pet audio',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            isPlaying
                                ? 'Tap pause to stop for a moment'
                                : 'Tap play to hear Kimchi',
                            style: const TextStyle(
                              color: Color(0xFFB9C8D2),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isPlaying)
                      const Icon(
                        Icons.graphic_eq_rounded,
                        color: _gold,
                      ),
                  ],
                ),
              ),
            ],
          ),
        );

        final showcase = Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: _ink,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: _ink.withValues(alpha: 0.16),
                blurRadius: 24,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: compact
              ? Column(
                  children: [
                    image,
                    SizedBox(
                      height: 330,
                      child: content,
                    ),
                  ],
                )
              : SizedBox(
                  height: 430,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(flex: 6, child: image),
                      const SizedBox(width: 8),
                      Expanded(flex: 4, child: content),
                    ],
                  ),
                ),
        );

        return showcase;
      },
    );
  }
}

class PetInfoGrid extends StatelessWidget {
  const PetInfoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    const items = [
      PetInfo(
        icon: Icons.photo_rounded,
        label: 'Photo',
        value: 'Favorite portrait',
        color: _coral,
      ),
      PetInfo(
        icon: Icons.graphic_eq_rounded,
        label: 'Sound',
        value: 'Playful audio',
        color: _teal,
      ),
      PetInfo(
        icon: Icons.favorite_rounded,
        label: 'Companion',
        value: 'Kimchi the Shih Tzu',
        color: _gold,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth >= 900
            ? 3
            : constraints.maxWidth >= 600
                ? 2
                : 1;
        const spacing = 12.0;
        final itemWidth =
            (constraints.maxWidth - (spacing * (columns - 1))) / columns;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: items
              .map(
                (item) => SizedBox(
                  width: itemWidth,
                  child: PetInfoTile(item: item),
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class PetInfoTile extends StatefulWidget {
  final PetInfo item;

  const PetInfoTile({
    super.key,
    required this.item,
  });

  @override
  State<PetInfoTile> createState() => _PetInfoTileState();
}

class _PetInfoTileState extends State<PetInfoTile> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, isHovered ? -5 : 0, 0),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: isHovered
              ? item.color.withValues(alpha: 0.08)
              : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isHovered
                ? item.color.withValues(alpha: 0.70)
                : _line,
          ),
          boxShadow: [
            BoxShadow(
              color: isHovered
                  ? item.color.withValues(alpha: 0.18)
                  : _ink.withValues(alpha: 0.05),
              blurRadius: isHovered ? 18 : 10,
              offset: Offset(0, isHovered ? 8 : 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: item.color.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(item.icon, color: item.color, size: 25),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.label.toUpperCase(),
                    style: TextStyle(
                      color: item.color,
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.7,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item.value,
                    style: const TextStyle(
                      color: _ink,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_outward_rounded,
              size: 20,
              color: isHovered ? item.color : const Color(0xFF9AA8B2),
            ),
          ],
        ),
      ),
    );
  }
}

class ContentFrame extends StatelessWidget {
  final List<Widget> children;

  const ContentFrame({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final horizontalPadding = width < 600
        ? 16.0
        : width < 1000
            ? 24.0
            : 32.0;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 24,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children,
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            color: Color(0xFF667784),
            height: 1.35,
          ),
        ),
      ],
    );
  }
}

class ProfileDetail {
  final IconData icon;
  final String label;
  final String value;

  const ProfileDetail({
    required this.icon,
    required this.label,
    required this.value,
  });
}

class FocusArea {
  final IconData icon;
  final String title;
  final String description;

  const FocusArea({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class PetInfo {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const PetInfo({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });
}
