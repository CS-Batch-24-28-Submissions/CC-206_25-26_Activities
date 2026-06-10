//Constructing Classes
class Animal {
  //Data Types: String, String, Int
  String name;
  String kingdom;
  DateTime dob;
  int numLegs;

//Constructing Classes, named parameters, variable initialization
  Animal({
    required this.name,
    required this.kingdom,
    required this.dob,
    required this.numLegs,
  });


  void walk(String direction) {
    //conditionals
    if (numLegs == 0) {
      print('$name can\'t walk.');
    } else {
      print('$name is walking $direction.');
    }
  }

  String displayInfo() {
    return 'Name: $name | Kingdom: $kingdom | Date of Birth: ${dob.toLocal().toString().split(' ')[0]} | Number of Legs: $numLegs';
  }
}

class Pet extends Animal {
  String nickname;
  int kindness;

  Pet({
    required super.name,
    required super.kingdom,
    required super.dob,
    required super.numLegs,
    //this, constructor shorthand 
    required this.nickname, 
    this.kindness = 0,
  });


 Pet.withNickname({
    required super.name,
    required super.kingdom,
    required super.dob,
    required super.numLegs,
    required this.nickname,
    this.kindness = 10, 
  });

  // Named Constructors
  Pet.withoutNickname({
    required super.name,
    required super.kingdom,
    required super.dob,
    required super.numLegs,
    this.kindness = 0, 
  })  : nickname = 'No Nickname'; 


   void kick(int value) {
    kindness -= value;
    print('You kicked $nickname! Kindness decreased by $value. Kindness is now $kindness.');
  }

  void pet(int value) {
    if (kindness < 0) {
      print('$nickname is too upset to be petted right now!');
    } else {
      kindness += value;
      print('You petted $nickname! Kindness increased by $value. Kindness is now $kindness.');
    }
  }

  void feed(int value) {
    if (kindness < 0) {
      kindness += value;
      print('You fed $nickname! They\'re warming up. Kindness increased by $value. Kindness is now $kindness.');
    } else {
      kindness += value;
      print('You fed $nickname! Kindness increased by $value. Kindness is now $kindness.');
    }
  }

  @override
  String displayInfo() {
    return '${super.displayInfo()} | Nickname: $nickname | Kindness: $kindness';
  }
}


void main() {
  // Lists and Arrays
  List<Animal> ZOO = [
    Animal(
      name: 'Lion',
      kingdom: 'Animalia',
      dob: DateTime(2018, 3, 15),
      numLegs: 4,
    ),
    Animal(
      name: 'Eagle',
      kingdom: 'Animalia',
      dob: DateTime(2020, 7, 22),
      numLegs: 2,
    ),
    Animal(
      name: 'Snake',
      kingdom: 'Animalia',
      dob: DateTime(2019, 11, 5),
      numLegs: 0,
    ),
    Animal(
      name: 'Elephant',
      kingdom: 'Animalia',
      dob: DateTime(2015, 1, 30),
      numLegs: 4,
    ),
    Animal(
      name: 'Dolphin',
      kingdom: 'Animalia',
      dob: DateTime(2021, 6, 10),
      numLegs: 0,
    ),
  ];

  // Looping
  print('=== ZOO ===');
  for (Animal animal in ZOO) {
    print(animal.displayInfo());
    animal.walk('forward');
  }

  List<Pet> PET_HOME = [
    Pet.withNickname(
      name: 'Buddy',
      kingdom: 'Animalia',
      dob: DateTime(2020, 1, 1),
      numLegs: 4,
      nickname: 'Bud',
    ),
    Pet.withNickname(
      name: 'Mittens',
      kingdom: 'Animalia',
      dob: DateTime(2021, 3, 14),
      numLegs: 4,
      nickname: 'Mitts',
    ),
    Pet.withoutNickname(
      name: 'Goldie',
      kingdom: 'Animalia',
      dob: DateTime(2022, 8, 20),
      numLegs: 0,
    ),
  ];

  print('\n=== PET HOME ===');

  // Decrease kindness below 0 for Buddy and Mittens
  print('\n-- Decreasing Kindness --');
  PET_HOME[0].kick(15);
  PET_HOME[0].kick(15);
  PET_HOME[1].kick(20);

  // Increase kindness above 1000 for Mittens and Goldie
  print('\n-- Increasing Kindness --');
  for (int i = 0; i < 55; i++) { // Looping
    PET_HOME[1].feed(20);
  }
  for (int i = 0; i < 50; i++) { // Looping
    PET_HOME[2].feed(25);
  }

  // Print final state of all pets
  print('\n-- Final Pet Status --');
  for (Pet p in PET_HOME) { // Looping
    print(p.displayInfo());
  }
}