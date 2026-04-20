import 'package:flutter/material.dart';
import 'package:my_info/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile',
      home: const MyHomePage(title: 'Unit 6 - Simple Profile Activity'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        title: Text('My Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: [
          // Section 1: Profile Picture and Name
          Card(
            elevation: 4,
            shadowColor: Colors.black,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile_picture.png'),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'John Mark Panganiban',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 16),

          // Section 2: Details 
          Card(
            elevation: 4,
            shadowColor: Colors.black,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text('Email'),
                  subtitle: Text(Me.email),
                ),
                Divider(height: 0),
                ListTile(
                  leading: Icon(Icons.school),
                  title: Text('Education'),
                  subtitle: Text(Me.education),
                ),
                Divider(height: 0),
                ListTile(
                  leading: Icon(Icons.book),
                  title: Text('Course'),
                  subtitle: Text(Me.course)
                ),
                Divider(height: 0),
                ListTile(
                  leading: Icon(Icons.sports_esports),
                  title: Text('Hobbies'),
                  subtitle: Text(Me.hobbies)
                ),
                Divider(height: 0),
                ListTile(
                  leading: Icon(Icons.account_tree),
                  title: Text('Favorite Data Structure'),
                  subtitle: Text(Me.favoriteDS)
                ),
              ],
            ),
          ),

          SizedBox(height: 16),

          // Section 3: Biography
          Card(
            elevation: 4,
            shadowColor: Colors.black,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hi, I am John Mark Panganiban!', 
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  Text(Me.biography),
                ],
              ),
            ),
          )
        ]
      ),
    );
  }
}