import 'package:flutter/material.dart';
import 'package:my_profile_app/screens/home_screen.dart';
import 'package:my_profile_app/screens/profile_screen.dart';

// main navigation widget
// handles bottom navigation between home and profile screens
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {

  // selected tab index
  int _selectedIndex = 0;

  // list of screens for navigation
  final List<Widget> _screens = [HomeScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // main screen body with animated transition
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: KeyedSubtree(
          key: ValueKey(_selectedIndex),
          child: _screens[_selectedIndex],
        ),
      ),

      // bottom navigation bar
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF1A1A1A),
          border: Border(
            top: BorderSide(color: Color(0xFF3A3A3A), width: 1),
          ),
        ),

        child: SafeArea(
          child: SizedBox(
            height: 56,

            child: Row(
              children: [

                // home navigation item
                _NavItem(
                  icon: Icons.home_outlined,
                  activeIcon: Icons.home,
                  label: 'HOME',
                  index: 0,
                  selected: _selectedIndex,
                  onTap: (i) => setState(() => _selectedIndex = i),
                ),

                // divider line
                Container(
                  width: 1,
                  height: 36,
                  color: const Color(0xFF3A3A3A),
                ),

                // profile navigation item
                _NavItem(
                  icon: Icons.person_outline,
                  activeIcon: Icons.person,
                  label: 'PROFILE',
                  index: 1,
                  selected: _selectedIndex,
                  onTap: (i) => setState(() => _selectedIndex = i),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// navigation item widget
// represents each tab in bottom navigation bar
class _NavItem extends StatelessWidget {

  final IconData icon;
  final IconData activeIcon;
  final String label;
  final int index;
  final int selected;
  final void Function(int) onTap;

  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.index,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    // check if item is active
    final isActive = index == selected;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        behavior: HitTestBehavior.opaque,

        child: Container(

          // background color changes when active
          color: isActive
              ? const Color(0xFF2A2A2A)
              : const Color(0xFF1A1A1A),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // icon changes based on active state
              Icon(
                isActive ? activeIcon : icon,
                color: isActive
                    ? const Color(0xFFF5F0E8)
                    : const Color(0xFF5A5A5A),
                size: 20,
              ),

              const SizedBox(height: 3),

              // label text
              Text(
                label,
                style: TextStyle(
                  color: isActive
                      ? const Color(0xFFF5F0E8)
                      : const Color(0xFF5A5A5A),
                  fontSize: 8,
                  letterSpacing: 2.5,
                  fontWeight:
                      isActive ? FontWeight.w700 : FontWeight.w400,
                ),
              ),

              // active indicator line
              if (isActive) ...[
                const SizedBox(height: 3),
                Container(
                  width: 20,
                  height: 1.5,
                  color: const Color(0xFFC0392B),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}