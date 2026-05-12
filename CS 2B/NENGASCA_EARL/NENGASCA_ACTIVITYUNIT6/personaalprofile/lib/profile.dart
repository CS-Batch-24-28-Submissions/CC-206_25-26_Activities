import 'package:flutter/material.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF2E3),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 71, 224, 241),
        title: const Text(
          'Earl Shanlie Nengasca', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),
        ),
       
      ),


      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

          //---CONTAINER FOR PERSONAL INFORMATION---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              
              decoration: BoxDecoration(
                color: const Color.fromARGB(150, 97, 232, 225),
               
                borderRadius: BorderRadius.circular(28),
            
               
              ),
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage( 'assets/face.jpeg'),
                  ),
                  SizedBox(width: 16),
                  
                  Text(
                    'Earl Shanlie Nengasca',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color.fromARGB(255, 0, 0, 0),
          
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 17),

            // ---CONTAINER FOR PERSONAL INFORMATION---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(150, 97, 232, 225),
              
                borderRadius: BorderRadius.circular(28),
              ),




              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Stuff About Me',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  SizedBox(height: 12),

                 
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.favorite_outline, color: Color.fromARGB(255, 27, 13, 123)),
                      SizedBox(width: 8),
                      Text('Hobbies:  ', 
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),
                      Text('Manga, Gaming, Gym',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.phone_outlined, color: Color.fromARGB(255, 27, 13, 123)),
                      SizedBox(width: 8),
                      Text('Phone:  ', 
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),
                      Text('+63 9926262626',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.email_outlined, color: Color.fromARGB(255, 27, 13, 123)),
                      SizedBox(width: 8),
                      Text('Email:  ',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                       Text('earlnengasca123@gmail.com',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),  
                   Row(
                    children: [
                      Icon(Icons.cake_outlined, color: Color.fromARGB(255, 27, 13, 123)),
                      SizedBox(width: 8),
                         Text('Date of Birth:  ',
                         style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),
                      Text('October 15, 2005',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),
                    ],
                  ),

                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.school_outlined, color: Color.fromARGB(255, 27, 13, 123)),
                            SizedBox(width: 8),
                      Text('Course:  ', 
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),
                      Text('BS Computer Science',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                            children: [
                      Icon(Icons.menu_book, color: Color.fromARGB(255, 27, 13, 123)),
                      SizedBox(width: 8),
                      Text('Favourite Food:  ',
                             style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
         Text('Plain Rice with Chicken Adobo',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),),
                      ),
                    ],
                  ),  
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.auto_awesome_mosaic_sharp, color: Color.fromARGB(255, 27, 13, 123)),
                      SizedBox(width: 8),
                      Text('Favourite Athelete:  ',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
               ),
                       Text('Christiano Ronaldo',
                 style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),),
                      ),
                    ],  
                  )
                ],
              ),
            ),

            const SizedBox(height: 17),

            // ---CONTAINER FOR MY BIOGRAPHY---
            Container(
             decoration: BoxDecoration(
                 color: const Color.fromARGB(150, 97, 232, 225),
          borderRadius: BorderRadius.circular(28),
              ),
              width: double.infinity,
              padding: const EdgeInsets.all(20),



              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Biography',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'I am Earl Shanlie Nengasca, a Computer Science student currently in my second year of college.'
                    'I always have been fond of technology from a very young age. It started when my Tito first introduced me'
                    'to a computer, it was a game called counter strike 1.6, and I was instantly hooked. '
                    'I hope to somehow work in a big tech company like NVIDIA or Apple.',
                    style: TextStyle(fontSize: 15, 
                    height: 2.0, color:
                     Color.fromARGB(255, 0, 0, 0)),
                    textAlign: TextAlign.justify,
                  
                  
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}