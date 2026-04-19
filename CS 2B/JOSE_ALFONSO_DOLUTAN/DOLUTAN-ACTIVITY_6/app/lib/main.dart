import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.blue)),
      home: const MyHomePage(title: 'Jose Alfonso Dolutan'), // full name on top 
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _buildInfoRow( // build a row using these attributes (reduces code duplication)
    IconData icon, // icon before data
    Color iconColor, // icon color
    String label, // what will be hardcoded
    String value, // int or string
  ) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, color: iconColor),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: TextStyle(fontSize: 12, color: Colors.grey)),
                Text(
                  value,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar( // where I would put my profile picture
                    radius: 50,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, size: 60, color: Colors.white),
                  ),
                  SizedBox(width: 20),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jose Alfonso E. Dolutan', // my full name beside the profile picture
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Aspiring Cloud Engineer || Project Manager', // future job
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic, // italic to match resumes
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal Information',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  _buildInfoRow(
                    Icons.cake,
                    Colors.blue,
                    'Birthday',
                    'May 30, 2005',
                  ),
                  _buildInfoRow(
                    Icons.location_on,
                    Colors.red,
                    'Address',
                    '26 Fajardo Extention, Jaro, Iloilo City',
                  ),
                  _buildInfoRow(
                    Icons.email,
                    Colors.purple,
                    'Email',
                    'business.alfonsodolutan@gmail.com',
                  ),
                  _buildInfoRow(
                    Icons.phone,
                    Colors.green,
                    'Phone Number',
                    '+639470485638',
                  ),
                  _buildInfoRow(
                    Icons.school,
                    Colors.orange,
                    'Education',
                    'West Visayas State University: Main Campus',
                  ),
                  _buildInfoRow(
                    Icons.book,
                    Colors.teal,
                    'Course',
                    'Bachelor of Science in Computer Science: Major in AI',
                  ),
                  _buildInfoRow(
                    Icons.favorite,
                    Colors.pink,
                    'Hobbies',
                    'Football, Sim-Racing, Working Out, Sleeping, Music',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
