import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/pet_info_row.dart';
import 'package:audioplayers/audioplayers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // "Home" Header
            const Row(
              children: [
                Icon(Icons.home, color: AppColors.textDark, size: 28),
                SizedBox(width: 10),
                Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),

            const Text(
              'My Pet',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                fontFamily: 'Poppins',
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 15),

            // Pet Section Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Pet Image Placeholder
                Container(
                  width: 170,
                  height: 230,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/chuckie.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 20),

                // Pet Details Column
                const Expanded(
                  child: Column(
                    children: [
                      PetInfoRow(
                        icon: Icons.badge,
                        label: 'Name',
                        value: 'Chuckie',
                      ),
                      PetInfoRow(
                        icon: Icons.pets,
                        label: 'Breed',
                        value: 'Aspin',
                      ),
                      PetInfoRow(
                        icon: Icons.favorite,
                        label: 'Likes',
                        value: 'Eating food, your attention',
                      ),
                      PetInfoRow(
                        icon: Icons.heart_broken,
                        label: 'Dislikes',
                        value: 'When you pet other dogs </3',
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Woof Button
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () async {
                  await player.play(AssetSource('sounds/dog-bark.m4a'));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.textDark,
                  foregroundColor: Colors.white,
                  elevation: 8,
                  shadowColor: Colors.black.withValues(alpha: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Press to HEAR Chuckie Woof!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Petting Button
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () async {
                  await player.play(AssetSource('sounds/dog-pet.m4a'));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.textDark,
                  foregroundColor: Colors.white,
                  elevation: 8,
                  shadowColor: Colors.black.withValues(alpha: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Press to PET THAT DAWG!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
