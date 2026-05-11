import 'package:flutter/material.dart';
import 'utils/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pinkMist50,
      appBar: AppBar(
        backgroundColor: AppColors.sage300,
        elevation: 0,
        title: const Text('Mary Dawn Alido', 
        style: TextStyle(color: AppColors.pinkMist900, 
        fontSize: 16,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //widgets for profile picture, info, and biography
              _buildHeader(),
              const SizedBox(height: 32),
              _buildInfo(),
              const SizedBox(height: 25),
              _buildBio(),
          ],
        )
      ),
    );
  }
}

//widget for profile picture and name
Widget _buildHeader(){
  return Row(
    children: [
      CircleAvatar(
        radius: 40,
        backgroundImage: AssetImage('assets/images/profile.png'),
      ),
      const SizedBox(width: 20),
      
      Column( //name and course
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Mary Dawn Alido',
            style: TextStyle(color: AppColors.pinkMist900, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          Container( // course container
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.sage100,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Text(
              'BS Computer Science',
              style: TextStyle(color: AppColors.sage700, fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      )
    ],
  );
}

Widget _buildInfo(){ //widget for my info 
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      border: Border.all(color: AppColors.pinkMist300)
    ),
    child: Column(
      children: [
        _buildInfoRow(Icons.email,'Email', 'marydawn.alido@wvsu.edu.ph'),
        _buildDivider(),
        _buildInfoRow(Icons.star, 'Hobbies', 'Watching Movies, Solving Soduku, Reading manga'),
        _buildDivider(),
        _buildInfoRow(Icons.location_on, 'Location', 'Iloilo City, Philippines'),
        _buildDivider(),
        _buildInfoRow(Icons.cake, 'Birthday', 'May 08, 2006'),
        _buildDivider(),
        _buildInfoRow(Icons.code, 'GitHub', 'github.com/meidun-pp'),
      ],
    ),
  );
}

Widget _buildInfoRow(
  IconData icon,
  String label,
  String value, ) 
  { 
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.orchid50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: AppColors.orchid900, size: 20),
        ),
        const SizedBox(width: 16),
        
        Expanded( // Expanded to take remaining space
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: AppColors.pinkMist300, fontSize: 11, letterSpacing: 1, fontWeight: FontWeight.bold)),
            const SizedBox(height: 2),
            Text(value, style: TextStyle(color: AppColors.pinkMist900, fontSize: 14, fontWeight: FontWeight.w500)),
          ],
        )
        )
      ],
    ),
  );
}

Widget _buildBio() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.sage900,
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Biography',
            style: TextStyle(
              color: AppColors.sage300,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'I am currently a 2nd year student majoring in Computer Science, '
            'I’ve spent the last year diving deep into learning about my interests and passions. '
            ' When I’m not staring at a screen trying to figure out what’s wrong with my code, '
            ' you can usually find me solving Sudoku puzzles or heading back to Maasin to catch up with my family.'
            ' Lately, I’ve been diving into game development, '
            'I love the mix of storytelling and technical problem-solving that goes into game design where it’s like building a world and the rules that govern it all at once.',
            style: TextStyle(
              color: AppColors.sage50,
              fontSize: 14,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

Widget _buildDivider(){
  return Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
  child: Divider(color: AppColors.pinkMist50, height: 1));
}