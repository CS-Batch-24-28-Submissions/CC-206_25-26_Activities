// CONCEPT: Constructing Classes
class Animal {
  // CONCEPT: Attributes: Name, Kingdom, Dob, Numlegs
  String name;
  String kingdom;
  String dob;
  int numlegs;

  // CONCEPT: Constructor
  Animal(this.name, this.kingdom, this.dob, this.numlegs);

  // CONCEPT: Method: Walk accepts a direction parameter
  void walk(String direction) {
    if (numlegs == 0) {
      print('$name can\'t walk');
    } else {
      print('$name walks $direction');
    }
  }

  // CONCEPT: Method: displayInfo returns a summary string
  String displayInfo() => '''
Name: $name
Kingdom: $kingdom
DOB: $dob
Legs: $numlegs
''';
}

// CONCEPT: Constructing Classes
class Pet extends Animal {
  // CONCEPT: Attributes: Nickname, Kindness
  String? nickname;
  int _kindness = 0; // CONCEPT: Private class member, initialized to 0

  int get kindness => _kindness;

  // CONCEPT: Named constructor with nickname
  Pet(String name, String kingdom, String dob, int numlegs, this.nickname)
    : super(name, kingdom, dob, numlegs) {
    if (nickname != null) {
      _kindness = 10;
    }
  }

  // CONCEPT: Named constructor without nickname
  Pet.withoutNickname(String name, String kingdom, String dob, int numlegs)
    : super(name, kingdom, dob, numlegs);

  @override
  String displayInfo() => 'Name: $name, Nickname: ${nickname ?? 'None'}, Kingdom: $kingdom, DOB: $dob, Legs: $numlegs';

  // CONCEPT: Method: Kick decreases kindness
  void kick() {
    _kindness -= 5;
    print('  Kicked $displayName, kindness decreased to $_kindness');
  }

  String get displayName => nickname != null ? '$name ($nickname)' : name;

  // CONCEPT: Method: Pet increases kindness unless kindness is below 0
  void pet() {
    if (_kindness < 0) {
      print('  Failed to pet $displayName, kindness is $_kindness');
    } else {
      _kindness += 10;
      print('  Petted $displayName, kindness increased to $_kindness');
    }
  }

  // CONCEPT: Method: Feed increases kindness by a larger amount
  void feed() {
    _kindness += 500;
    print('  Fed $displayName, kindness increased to $_kindness');
  }
}

// CONCEPT: Entry Point
void main() {
  // CONCEPT: Lists and Arrays: ZOO contains 5 Animal objects (UPDATED)
  var zoo = <Animal>[
    Animal('Cheetah', 'Mammal', '2021-04-12', 4),
    Animal('Dolphin', 'Mammal', '2019-08-24', 0),
    Animal('Owl', 'Bird', '2020-10-05', 2),
    Animal('Kangaroo', 'Mammal', '2018-12-01', 2),
    Animal('Spider', 'Arachnid', '2023-02-14', 8),
  ];

  // CONCEPT: Looping through ZOO and calling functions
  print('=== ZOO ANIMALS ===');
  for (var animal in zoo) {
    print('----------');
    print('${animal.name}');
    animal.walk('north');
    print(animal.displayInfo());
  }

  // CONCEPT: Lists and Arrays: PET_HOME contains Pet objects (UPDATED)
  var petHome = <Pet>[
    Pet('Ferret', 'Mammal', '2022-01-10', 4, 'Bandit'),
    Pet.withoutNickname('Rabbit', 'Mammal', '2023-05-18', 4),
    Pet('Parrot', 'Bird', '2021-09-09', 2, 'Echo'),
  ];

  print('\n=== PET HOME ===');
  print('--- Pet 1 actions ---');
  petHome[0].kick();
  petHome[0].kick();
  print('');

  print('--- Pet 2 actions ---');
  petHome[1].feed();
  petHome[1].feed();
  petHome[1].feed();
  print('');

  print('--- Pet 3 actions ---');
  petHome[2].feed();
  petHome[2].feed();
  petHome[2].feed();
  print('');
}