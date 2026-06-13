import 'animal.dart';
import 'dart:io'; // this is for input and output operations

class Pet extends Animal {
  String? nickname; // using ? for allowing null variables (for constructor)
  int kindness = 0;

  // Super Constructor
  Pet.withNickname(super.name, super.kingdom, super.dob, super.numlegs, super.walkDirection,this.nickname) : kindness = 1000; // initalizer list
  Pet.withoutNickname(super.name, super.kingdom, super.dob, super.numlegs, super.walkDirection); 

  void kick(){ // kick method (to lessen kindness)
    print("You have kicked your pet! Kindness decreased");
    kindness -= 10; 
  }

  void pet(){ // pet method (to add kindness)
    if(kindness <= 0){ // 
      print("The pet hates you! It keeps running away when you try to pet!");
    } else {
      print("You gave care to your pet! Kindness Increased");
      kindness += 10;
    }
  }

  void feed(){ // feed method (to lessen or add kindness)
    stdout.write("Would you like to feed your pet (y/n)?: ");
    String? input = stdin.readLineSync()?.trim().toLowerCase(); 

      if(input == 'y') {
        kindness += 1200;
        print("You fed your pet! Kindness increased!");
      } else if (input == 'n'){
        kindness -= 1200;
        print("You didn't feed your pet! Kindness decreased!");
      } else {
        print("Invalid Option, Please Enter y or n only");
      }  
  }

@override
  void displayInfo(){ // display info and kindness meter of a pet
    print('Name: $name');
    print('Kingdom: $kingdom');
    print('Date of Birth: $dob');
    print("Nickname: $nickname");
    print("Kindness Meter: $kindness");
  }
}