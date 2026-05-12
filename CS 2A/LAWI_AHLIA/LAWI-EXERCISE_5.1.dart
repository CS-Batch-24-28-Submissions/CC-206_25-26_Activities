// unit 5 part 1 activity - dart oop

// question 1: animal class

// concept 1: defining a class
class Animal {
  // concept 2: class attributes
  String name;
  String kingdom;
  DateTime dob;
  int numLegs;

  // concept 3: constructor shorthand
  Animal({
    required this.name,
    required this.kingdom,
    required this.dob,
    required this.numLegs,
  });

  // method: walk with named parameter
  void walk({required String direction}) {
    // concept 4 & 5: conditional check
    if (numLegs == 0) {
      print('$name cannot walk because it has no legs.');
    } else {
      print('$name is walking towards the $direction.');
    }
  }

  // method: display animal info
  String displayInfo() =>
      'Animal Info:\n'
      '  Name    : $name\n'
      '  Kingdom : $kingdom\n'
      '  DOB     : ${dob.toLocal().toString().split(' ')[0]}\n'
      '  Legs    : $numLegs';
}


// question 2: pet class (inherits from animal)

class Pet extends Animal {
  String? nickname;
  int _kindness;   // private variable

  // concept 6~: named constructors
  Pet.withNickname({
    required String name,
    required String kingdom,
    required DateTime dob,
    required int numLegs,
    required String this.nickname,
  })  : _kindness = 50,
        super(name: name, kingdom: kingdom, dob: dob, numLegs: numLegs);

  Pet.withoutNickname({
    required String name,
    required String kingdom,
    required DateTime dob,
    required int numLegs,
  })  : _kindness = 0,
        super(name: name, kingdom: kingdom, dob: dob, numLegs: numLegs);

  // getter for kindness
  int get kindness => _kindness;

  // decrease kindness
  void kick({int amount = 10}) {
    _kindness -= amount;
    print('$name was kicked! Kindness decreased by $amount. '
        'Current kindness: $_kindness');
  }

  // increase kindness (fails if too low)
  void pet({int amount = 15}) {
    if (_kindness < 0) {
      print('Failed to pet $name — kindness is too low ($_kindness). '
          'It trusts you too little right now!');
    } else {
      _kindness += amount;
      print('$name was petted! Kindness increased by $amount. '
          'Current kindness: $_kindness');
    }
  }

  // increase kindness by feeding
  void feed({int amount = 20}) {
    _kindness += amount;
    print('$name was fed! Kindness increased by $amount. '
        'Current kindness: $_kindness');
  }

  // override display info to show pet details
  @override
  String displayInfo() =>
      super.displayInfo() +
      '\n  Nickname: ${nickname ?? "(none)"}'
      '\n  Kindness: $_kindness';
}


// question 3: main program

void main() {
  print('========================================');
  print(' UNIT 5 PART 1 — Dart OOP Activity');
  print('========================================\n');

  // zoo: list of animals
  final List<Animal> baseAnimals = [
    Animal(
      name: 'Leo',
      kingdom: 'Mammalia',
      dob: DateTime(2018, 3, 14),
      numLegs: 4,
    ),
    Animal(
      name: 'Nemo',
      kingdom: 'Actinopterygii',
      dob: DateTime(2020, 6, 1),
      numLegs: 0,
    ),
  ];

  final List<Animal> ZOO = [
    ...baseAnimals,
    Animal(
      name: 'Tweety',
      kingdom: 'Aves',
      dob: DateTime(2021, 1, 20),
      numLegs: 2,
    ),
    Animal(
      name: 'Rex',
      kingdom: 'Reptilia',
      dob: DateTime(2015, 11, 5),
      numLegs: 4,
    ),
    Animal(
      name: 'Slimy',
      kingdom: 'Gastropoda',
      dob: DateTime(2023, 8, 8),
      numLegs: 0,
    ),
  ];

  print('--- ZOO (${ZOO.length} animals) ---\n');

  final List<String> directions = ['North', 'South', 'East', 'West', 'North'];

  for (int i = 0; i < ZOO.length; i++) {
    final animal = ZOO[i];
    print(animal.displayInfo());
    animal.walk(direction: directions[i]);
    print('');
  }

  // pet home: list of pets
  final List<Pet> PET_HOME = [
    Pet.withNickname(
      name: 'Buddy',
      kingdom: 'Mammalia',
      dob: DateTime(2019, 5, 10),
      numLegs: 4,
      nickname: 'Bud',
    ),
    Pet.withNickname(
      name: 'Whiskers',
      kingdom: 'Mammalia',
      dob: DateTime(2020, 2, 14),
      numLegs: 4,
      nickname: 'Whisk',
    ),
    Pet.withoutNickname(
      name: 'Goldie',
      kingdom: 'Actinopterygii',
      dob: DateTime(2022, 7, 7),
      numLegs: 0,
    ),
  ];

  print('--- PET_HOME (${PET_HOME.length} pets) ---\n');

  // show initial pets
  for (var pet in PET_HOME) {
    print(pet.displayInfo());
    print('');
  }

  // decrease kindness of buddy and whiskers below 0
  print('--- Decreasing kindness of Buddy and Whiskers below 0 ---\n');

  PET_HOME[0].kick(amount: 30);
  PET_HOME[0].kick(amount: 30);
  PET_HOME[0].kick(amount: 30);

  print('');

  PET_HOME[1].kick(amount: 40);
  PET_HOME[1].kick(amount: 40);

  print('');

  PET_HOME[0].pet();
  PET_HOME[1].pet();

  print('');

  // raise kindness of buddy and goldie above 1000
  print('--- Raising kindness of Buddy and Goldie above 1000 ---\n');

  for (int i = 0; i < 55; i++) {
    PET_HOME[0].feed(amount: 20);
  }

  print('');

  for (int i = 0; i < 34; i++) {
    PET_HOME[2].feed(amount: 20);
  }
  for (int i = 0; i < 22; i++) {
    PET_HOME[2].pet(amount: 15);
  }

  print('');

  // final pet states
  print('--- Final Pet States ---\n');
  for (var pet in PET_HOME) {
    print(pet.displayInfo());
    print('');
  }
}