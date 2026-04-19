import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Meet Bogart, my pet beagle!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  color: Colors.grey,
                  child: const Center(child: Text('Pet Picture')),
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.volume_up),
                  onPressed: () {
                    // Placeholder for audio playback
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
