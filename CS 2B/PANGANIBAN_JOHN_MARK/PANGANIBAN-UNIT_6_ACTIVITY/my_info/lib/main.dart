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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 34, 9, 77)),
      ),
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          // Profile section
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/profile_picture.png'),
              ),

              Text('John Mark Panganiban'),
            ],
          ),

          // More profile details section
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Email'),
            subtitle: Text(Me.email),
          ),

          ListTile(
            leading: Icon(Icons.school),
            title: Text('Education'),
            subtitle: Text(Me.education),
          ),

          ListTile(
            leading: Icon(Icons.book),
            title: Text('Course'),
            subtitle: Text(Me.course)
          ),

           ListTile(
            leading: Icon(Icons.sports_esports),
            title: Text('Hobbies'),
            subtitle: Text(Me.hobbies)
          ),

          ListTile(
            leading: Icon(Icons.account_tree),
            title: Text('Favorite Data Structure'),
            subtitle: Text(Me.favoriteDS)
          ),

          // Biography section
          Container(
            height: 60
          ),
        ]
      ),
    );
  }
}