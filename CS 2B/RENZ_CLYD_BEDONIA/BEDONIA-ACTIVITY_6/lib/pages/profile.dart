import 'package:flutter/material.dart';
import 'package:simpe_flutter_application/style/theme.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 32),

            // "My Profile" Widget
            Text(
              "My Profile",
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 32),

            // Image, Name, and Section Widget
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(500),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/profile_picture.jpg'),
                    ),
                    border: Border.all(color: AppTheme.appGreen, width: 2),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Renz Clyd D. Bedonia",
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "BSCS 2-B",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Info About Me
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

                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isWide = constraints.maxWidth > 600;
                    return Column(
                      children: [
                        // --- ROW 1 ---
                        if (isWide)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Birthday
                              Expanded(
                                child: _buildInfoItem(
                                  context,
                                  icon: Icons.cake,
                                  title: "Birthday",
                                  value: "August 26, 2006",
                                ),
                              ),

                              const SizedBox(width: 50),

                              // Email
                              Expanded(
                                child: _buildInfoItem(
                                  context,
                                  icon: Icons.mail,
                                  title: "Email",
                                  value: "renzclyd.bedonia@wvsu.edu.ph",
                                ),
                              ),
                            ],
                          )
                        else ...[
                          _buildInfoItem(
                            context,
                            icon: Icons.cake,
                            title: "Birthday",
                            value: "August 26, 2006",
                          ),
                          const SizedBox(height: 16),
                          _buildInfoItem(
                            context,
                            icon: Icons.mail,
                            title: "Email",
                            value: "renzclyd.bedonia@wvsu.edu.ph",
                          ),
                        ],

                        const SizedBox(height: 32),

                        // --- ROW 2 ---
                        if (isWide)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Address
                              Expanded(
                                child: _buildInfoItem(
                                  context,
                                  icon: Icons.home,
                                  title: "Address",
                                  value: "Tubungan, Barotac Nuevo",
                                ),
                              ),
                              const SizedBox(width: 50),
                              // Phone
                              Expanded(
                                child: _buildInfoItem(
                                  context,
                                  icon: Icons.phone,
                                  title: "Phone Number",
                                  value: "09512367680",
                                ),
                              ),
                            ],
                          )
                        else ...[
                          _buildInfoItem(
                            context,
                            icon: Icons.home,
                            title: "Address",
                            value: "Tubungan, Barotac Nuevo",
                          ),
                          const SizedBox(height: 16),
                          _buildInfoItem(
                            context,
                            icon: Icons.phone,
                            title: "Phone Number",
                            value: "09512367680",
                          ),
                        ],

                        const SizedBox(height: 32),

                        // --- ROW 3 ---
                        if (isWide)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // University
                              Expanded(
                                child: _buildInfoItem(
                                  context,
                                  icon: Icons.school_rounded,
                                  title: "University",
                                  value: "West Visayas State University",
                                ),
                              ),

                              const SizedBox(width: 50),

                              // Hobbies
                              Expanded(
                                child: _buildInfoItem(
                                  context,
                                  icon: Icons.favorite,
                                  title: "Hobbies",
                                  value: "Video Games, Designing, Working Out",
                                ),
                              ),
                            ],
                          )
                        else ...[
                          _buildInfoItem(
                            context,
                            icon: Icons.school_rounded,
                            title: "University",
                            value: "West Visayas State University",
                          ),
                          const SizedBox(height: 16),
                          _buildInfoItem(
                            context,
                            icon: Icons.favorite,
                            title: "Hobbies",
                            value: "Video Games, Designing, Working Out",
                          ),
                        ],
                      ],
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 32),

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
                      ("My Biography"),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 16),

                    Text(
                      "Hello there! I am Renz Clyd Bedonia, a UI/UX and Graphic Designer who thrives on turning complex user problems into aesthetic, high-fidelity solutions. I am currently a student at West Visayas State University's College of Information and Communications Technology, where I focus on system architecture and cross-platform development. My work is driven by a commitment to functional, user-centric design that bridges the gap between technical requirements and a seamless visual experience.",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
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

  // Helper Method
  Widget _buildInfoItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black, width: 1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 36),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(value, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
