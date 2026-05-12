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
  // CONCEPT: Lists and Arrays: ZOO contains 5 Animal objects
  var zoo = <Animal>[
    Animal('Lion', 'Mammal', '2020-01-01', 4),
    Animal('Snake', 'Reptile', '2019-05-10', 0),
    Animal('Eagle', 'Bird', '2018-03-20', 2),
    Animal('Elephant', 'Mammal', '2017-07-15', 4),
    Animal('Fish', 'Fish', '2021-11-30', 0),
  ];

  // CONCEPT: Looping through ZOO and calling functions
  print('=== ZOO ANIMALS ===');
  for (var animal in zoo) {
    print('----------');
    print('${animal.name}');
    animal.walk('north');
    print(animal.displayInfo());
  }

  // CONCEPT: Lists and Arrays: PET_HOME contains Pet objects
  var petHome = <Pet>[
    Pet('Dog', 'Mammal', '2021-03-15', 4, 'Buddy'),
    Pet.withoutNickname('Cat', 'Mammal', '2022-07-20', 4),
    Pet('Bird', 'Bird', '2023-11-05', 2, 'Tweety'),
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
