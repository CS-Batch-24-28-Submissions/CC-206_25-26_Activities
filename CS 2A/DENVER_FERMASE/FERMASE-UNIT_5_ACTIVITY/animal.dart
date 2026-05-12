// Concept: Constructing Classes
class Animal {
  // Concept: Attributes: Name, Kingdom, Dob, Numlegs
  String name;
  String kingdom;
  String dob;
  int numlegs;

  // Concept: Constructor
  Animal(this.name, this.kingdom, this.dob, this.numlegs);

  // Concept: Method: Walk accepts a direction parameter
  void walk(String direction) {
    if (numlegs == 0) {
      print('[MOVE FAILED] $name has no legs and cannot walk.');
    } else {
      print('[MOVE] $name travels toward $direction.');
    }
  }

  // Concept: Method: displayInfo returns a summary string
  String displayInfo() => '''
-----------------------------
Name     : $name
Group    : $kingdom
Born     : $dob
Leg Count: $numlegs
-----------------------------
''';
}

// Concept: Constructing Classes
class Pet extends Animal {
  // Concept: Attributes: Nickname, Kindness
  String? nickname;
  int _kindness = 0; // Concept: Private class member, initialized to 0

  int get kindness => _kindness;

  // Concept: Named constructor with nickname
  Pet(String name, String kingdom, String dob, int numlegs, this.nickname)
      : super(name, kingdom, dob, numlegs) {
    if (nickname != null) {
      _kindness = 20;
    }
  }

  // Concept: Named constructor without nickname
  Pet.withoutNickname(String name, String kingdom, String dob, int numlegs)
      : super(name, kingdom, dob, numlegs);

  @override
  String displayInfo() =>
      '[PET PROFILE] $name (${nickname ?? "no alias"}) | $kingdom | $dob | legs:$numlegs';

  // Concept: Method: Kick decreases kindness
  void kick() {
    _kindness -= 10;
    print('!! KICKED on $name - kindness is now $_kindness');
  }

  String get displayLabel => nickname != null ? '$name <${nickname}>' : name;

  // Concept: Method: Pet increases kindness unless kindness is below 0
  void pet() {
    if (_kindness < 0) {
      print('XX Interaction failed with $displayLabel (kindness=$_kindness)');
    } else {
      _kindness += 25;
      print('++ $displayLabel feels loved - +25 kindness ($_kindness)');
    }
  }

  // Concept: Method: Feed increases kindness by a larger amount
  void feed() {
    _kindness += 300;
    print('## Feeding session for $displayLabel - kindness boosted to $_kindness');
  }
}

void printHeader(String title) {
  print('\n===================================');
  print('        $title');
  print('===================================\n');
}

void printDivider() {
  print('\n-----------------------------------\n');
}

// Concept: Entry Point
void main() {
  // Concept: Lists and Arrays: ZOO contains 5 Animal objects
  final ZOO = <Animal>[
    Animal('Panther', 'Mammal', '2020-02-14', 4),
    Animal('Python', 'Reptile', '2019-09-01', 0),
    Animal('Hawk', 'Bird', '2018-11-23', 2),
    Animal('Buffalo', 'Mammal', '2017-06-30', 4),
    Animal('Eel', 'Aquatic', '2021-01-05', 0),
  ];

  // Concept: Looping through ZOO and calling functions
  printHeader('ZOO');
  for (var a in ZOO) {
    print('>> Inspecting ${a.name}');
    a.walk('north-east');
    print(a.displayInfo());
  }

  // Concept: Lists and Arrays: PET_HOME contains Pet objects
  final PET_HOME = <Pet>[
    Pet('Golden Retriever', 'Mammal', '2022-08-10', 4, 'Milo'),
    Pet.withoutNickname('Hamster', 'Mammal', '2023-03-21', 4),
    Pet('Canary', 'Bird', '2024-01-12', 2, 'Sunny'),
  ];

  printHeader('PET HOME');

  printDivider();
  print('PET A');
  PET_HOME[0].kick();
  PET_HOME[0].kick();
  PET_HOME[0].kick();

  printDivider();
  print('PET B');
  PET_HOME[1].feed();
  PET_HOME[1].feed();
  PET_HOME[1].feed();
  PET_HOME[1].feed();

  printDivider();
  print('PET C');
  PET_HOME[2].feed();
  PET_HOME[2].pet();
  PET_HOME[2].feed();
}