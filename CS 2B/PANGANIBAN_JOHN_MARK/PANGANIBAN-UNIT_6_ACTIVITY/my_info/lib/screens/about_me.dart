import 'package:flutter/material.dart';
import 'package:my_info/my_info.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {

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
                    backgroundImage: AssetImage('assets/images/profile_picture.png'),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      MyInfo.fullName,
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
                  subtitle: Text(MyInfo.email),
                ),
                Divider(height: 0),
                ListTile(
                  leading: Icon(Icons.school),
                  title: Text('Education'),
                  subtitle: Text(MyInfo.education),
                ),
                Divider(height: 0),
                ListTile(
                  leading: Icon(Icons.book),
                  title: Text('Course'),
                  subtitle: Text(MyInfo.course)
                ),
                Divider(height: 0),
                ListTile(
                  leading: Icon(Icons.sports_esports),
                  title: Text('Hobbies'),
                  subtitle: Text(MyInfo.hobbies)
                ),
                Divider(height: 0),
                ListTile(
                  leading: Icon(Icons.account_tree),
                  title: Text('Favorite Data Structure'),
                  subtitle: Text(MyInfo.favoriteDS)
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
                  Text('Hi, I am ${MyInfo.fullName}!', 
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  Text(MyInfo.biography),
                ],
              ),
            ),
          )
        ]
      ),
    );
  }
}