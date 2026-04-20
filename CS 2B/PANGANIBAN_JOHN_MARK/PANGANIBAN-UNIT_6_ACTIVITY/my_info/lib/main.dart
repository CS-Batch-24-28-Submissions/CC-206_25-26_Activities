import 'package:flutter/material.dart';
import 'package:my_info/card.dart';

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
  
  List<Container> myList = InfoCard.buildTemplateCards(4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(widget.title),
      ),
      body: Column(
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
          
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 5),
              itemCount: myList.length,
              itemBuilder: (context, index) {
                return myList[index];
              },
              separatorBuilder: (context, index) => SizedBox(height: 12),
            )
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
