// Programming concepts
/*
1. Class definition
2. Inheritance
3. Constructors
4. Encapsulation
5. Functions
6. Conditional statements
7. Loops
8. String formatting
 */

import 'dart:core';


// 1) Animal class
class Animal{
  String name;
  String kingdom;
  DateTime dob;
  int numLegs;

  Animal({
    required this.name,
    required this.kingdom,
    required this.dob,
    required this.numLegs,
  });

  // Walk function
  void walk(String direction){
    if(numLegs <= 0){
      print("$name is legless and cannot walk");
    }
    else{
      print("$name is walking $direction");
    }
  }

  // Display info
  String displayInfo(){
    int age = DateTime.now().year - dob.year;
    return "Animal: $name\n"
    "Kingdom: $kingdom\n"
    "Date of Birth: ${dob.toIso8601String().split('T')[0]}\n"
    "Age: $age years\n"
    "Legs: $numLegs";
  }
}

// 2) Pet class (extends Animal)
class Pet extends Animal{
  String? nickname;
  int kindness = 0;

  // Constructor 1
  Pet.withNickname({
    required String name,
    required String kingdom,
    required DateTime dob,
    required int numLegs,
    required this.nickname,
  }) : super(
          name: name,
          kingdom: kingdom,
          dob: dob,
          numLegs: numLegs,
        ) {
    kindness = 50;
  }

  // Constructor 2
  Pet({
    required String name,
    required String kingdom,
    required DateTime dob,
    required int numLegs,
  }) : super(
          name: name,
          kingdom: kingdom,
          dob: dob,
          numLegs: numLegs,
        );

  // Kick function decreases kindness
  void kick(int decreaseBy){
    kindness -= decreaseBy;
    print("You kicked $name (nickname: ${nickname ?? 'none'}). Kindness decreased by $decreaseBy. Current kindness: $kindness");
  }

  // Pet function increases kindness if >= 0
  void pet(int increaseBy){
    if (kindness < 0) {
      print("Failed to pet $name. Kindness is too low ($kindness).");
    } else {
      kindness += increaseBy;
      print("You petted $name (nickname: ${nickname ?? 'none'}). Kindness increased by $increaseBy. Current kindness: $kindness");
    }
  }

  // Feed  function (additional)
  void feed(int increaseBy){
    kindness += increaseBy;
    print("You fed $name (nickname: ${nickname ?? 'none'}).Kindness increased by $increaseBy. Current kindness: $kindness");
  }

  // Override displayInfo to include Pet-specific info
  @override
  String displayInfo(){
    String baseInfo = super.displayInfo();
    return "$baseInfo\nNickname: ${nickname ?? 'None'}\nKindness Level: $kindness";
  }
}

// 3) Main
void main(){
  print("===== ZOO =====");

  // Zoo list
  List<Animal> zoo = [
    Animal(
      name: "Wolf",
      kingdom: "Animalia",
      dob: DateTime(2005, 5, 14),
      numLegs: 4,
    ),
    Animal(
      name: "Lion",
      kingdom: "Animalia",
      dob: DateTime(2005, 11, 7),
      numLegs: 4,
    ),
    Animal(
      name: "Monkey",
      kingdom: "Animalia",
      dob: DateTime(2001, 9, 11),
      numLegs: 2,
    ),
    Animal(
      name: "Zebra",
      kingdom: "Animalia",
      dob: DateTime(2006, 7, 26),
      numLegs: 4,
    ),
    Animal(
      name: "Sea Lion",
      kingdom: "Animalia",
      dob: DateTime(2021, 12, 25),
      numLegs: 0,
    ),
  ];

  // 3a
  for (var animal in zoo) {
    print("\n${animal.displayInfo()}");
    animal.walk("forward");
    animal.walk("left");
    print("====================");
  }


  print("\n=== PET_HOME Section ===");

  // 3b
  List<Pet> petHome = [
    // With nickname
    Pet.withNickname(
      name: "Cat",
      kingdom: "Animalia",
      dob: DateTime(2025, 1, 1),
      numLegs: 4,
      nickname: "Megatron",
    ),
    
    // Without nickname
    Pet(
      name: "Dog",
      kingdom: "Animalia",
      dob: DateTime(2020, 9, 18),
      numLegs: 4,
    ),
    
    // With nickname
    Pet.withNickname(
      name: "Rabbit",
      kingdom: "Animalia",
      dob: DateTime(2023, 2, 14),
      numLegs: 4,
      nickname: "Marianne",
    ),
  ];

  // Decrease 2 pets below 0
  petHome[0].kick(100); 
  petHome[1].kick(200);

  // Increase 2 pets
  petHome[0].pet(50);
  petHome[2].pet(600);
  petHome[2].feed(500);

  // Increase one more significantly
  petHome[1].feed(1500);

  // Display all pets
  for (var pet in petHome) {
    print("\n${pet.displayInfo()}");
    pet.walk("around the house");
    print("====================");
  }
}