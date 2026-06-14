// ignore_for_file: avoid_print

// Name: Zyrus Christian E. Canteras
// Date: June 14, 2026
// Year and Section: BS Computer Science 2A
// Activity: Unit 5 Part 1

// PROGRAMMING CONCEPT 1: CLASS DEFINITION
class Animal {
  // PROGRAMMING CONCEPT 2: ATTRIBUTES
  String name;
  String kingdom;
  DateTime dob;
  int numlegs;

  // PROGRAMMING CONCEPT 3: CONSTRUCTOR
  Animal({
    required this.name,
    required this.kingdom,
    required this.dob,
    required this.numlegs,
  });

  // PROGRAMMING CONCEPT 4: METHOD WITH PARAMETER
  void walk(String direction) {
    // PROGRAMMING CONCEPT 5: CONDITIONAL STATEMENT
    if (numlegs <= 0) {
      print("$name has no legs, so it can't walk.");
    } else {
      print('$name walks toward the $direction.');
    }
  }

  // PROGRAMMING CONCEPT 6: FUNCTION WITH RETURN VALUE
  String displayInfo() {
    return 'Animal Information:\n'
        'Name: $name\n'
        'Kingdom: $kingdom\n'
        'Date of Birth: ${_formatDate(dob)}\n'
        'Number of Legs: $numlegs';
  }
}

// PROGRAMMING CONCEPT 7: INHERITANCE
class Pet extends Animal {
  String? nickname;
  int kindness;

  Pet({
    required super.name,
    required super.kingdom,
    required super.dob,
    required super.numlegs,
  }) : nickname = null,
       kindness = 0;

  // PROGRAMMING CONCEPT 8: CONSTRUCTOR OVERLOADING / NAMED CONSTRUCTOR
  Pet.withNickname({
    required super.name,
    required super.kingdom,
    required super.dob,
    required super.numlegs,
    required this.nickname,
  }) : kindness = 100;

  void kick(int value) {
    kindness -= value;

    print('$name was kicked.');
    print('Kindness decreased by $value.');
    print('Current kindness: $kindness');
  }

  void pet(int value) {
    if (kindness < 0) {
      print(
        'You tried to pet $name, but it failed because kindness is below 0.',
      );
    } else {
      kindness += value;

      print('You petted $name.');
      print('Kindness increased by $value.');
      print('Current kindness: $kindness');
    }
  }

  void feed(int value) {
    kindness += value;

    print('You fed $name.');
    print('Kindness increased by $value.');
    print('Current kindness: $kindness');
  }

  // PROGRAMMING CONCEPT 9: METHOD OVERRIDING / POLYMORPHISM
  @override
  String displayInfo() {
    return '${super.displayInfo()}\n'
        'Nickname: ${nickname ?? "No nickname"}\n'
        'Kindness: $kindness';
  }
}

void main() {
  // PROGRAMMING CONCEPT 10: LIST COLLECTION AND LOOP ITERATION
  // ignore: non_constant_identifier_names
  List<Animal> ZOO = [
    Animal(
      name: 'Lion',
      kingdom: 'Mammalia',
      dob: DateTime(2020, 5, 10),
      numlegs: 4,
    ),
    Animal(
      name: 'Eagle',
      kingdom: 'Aves',
      dob: DateTime(2021, 3, 15),
      numlegs: 2,
    ),
    Animal(
      name: 'Snake',
      kingdom: 'Reptilia',
      dob: DateTime(2019, 8, 20),
      numlegs: 0,
    ),
    Animal(
      name: 'Spider',
      kingdom: 'Arachnida',
      dob: DateTime(2022, 1, 25),
      numlegs: 8,
    ),
    Animal(
      name: 'Frog',
      kingdom: 'Amphibia',
      dob: DateTime(2023, 6, 12),
      numlegs: 4,
    ),
  ];

  print('ZOO ANIMALS');
  print('=========================');

  for (Animal animal in ZOO) {
    animal.walk('north');
    print(animal.displayInfo());
    print('-------------------------');
  }

  // ignore: non_constant_identifier_names
  List<Pet> PET_HOME = [
    Pet.withNickname(
      name: 'Dog',
      nickname: 'Buddy',
      kingdom: 'Mammalia',
      dob: DateTime(2021, 7, 18),
      numlegs: 4,
    ),
    Pet.withNickname(
      name: 'Cat',
      nickname: 'Mingming',
      kingdom: 'Mammalia',
      dob: DateTime(2022, 2, 9),
      numlegs: 4,
    ),
    Pet(
      name: 'Fish',
      kingdom: 'Actinopterygii',
      dob: DateTime(2023, 4, 5),
      numlegs: 0,
    ),
  ];

  print('\nPET HOME');
  print('=========================');

  for (Pet petAnimal in PET_HOME) {
    print(petAnimal.displayInfo());
    print('-------------------------');
  }

  PET_HOME[0].kick(150);
  PET_HOME[0].pet(50);
  print('-------------------------');

  PET_HOME[1].kick(200);
  PET_HOME[1].pet(100);
  print('-------------------------');

  PET_HOME[2].feed(1200);
  PET_HOME[2].pet(100);

  print('\nUPDATED PET INFORMATION');
  print('=========================');

  for (Pet petAnimal in PET_HOME) {
    print(petAnimal.displayInfo());
    print('-------------------------');
  }
}

String _formatDate(DateTime date) {
  String month = date.month.toString().padLeft(2, '0');
  String day = date.day.toString().padLeft(2, '0');

  return '${date.year}-$month-$day';
}
