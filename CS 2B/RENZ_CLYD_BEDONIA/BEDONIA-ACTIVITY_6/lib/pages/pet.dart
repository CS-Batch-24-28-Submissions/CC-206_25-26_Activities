import 'package:flutter/material.dart';
import 'package:simpe_flutter_application/style/theme.dart';
import 'package:simpe_flutter_application/widgets/cheems_button.dart';

class Pet extends StatelessWidget {
  const Pet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 32),

            // "My" Pet Widget
            Text(
              "My Pet",
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 32),

            // Pet Image
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              width: 500,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage("assets/images/pet_cheems.jpg"),
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomCenter,
                ),
                border: Border.all(color: AppTheme.appGreen, width: 2),
              ),
            ),

            const SizedBox(height: 32),

            // About Cheems
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.symmetric(
                  horizontal: 52,
                  vertical: 30,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ("Say hello to Cheems!"),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 16),

                    Text(
                      ("Cheems is a round and lovable Shiba Inu who captured the internet's heart with his shy smile and his famous 'cheemsburger' cravings. With his squinty eyes and soft, squishy appearance, he is the ultimate king of awkward but adorable vibes."),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),

                    const SizedBox(height: 32),

                    Text(
                      ("This is what he sounds like"),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 16),

                    const SoundButton(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "This application is made by Renz Clyd D. Bedonia for the compliance of Actvity 6 - Application Development.",
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
