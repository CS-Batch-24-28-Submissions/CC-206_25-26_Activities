// Programming Concept 1: Class - creates a blueprint for animal objects.
class Animal {
  final String name;
  final String kingdom;
  final DateTime dob;
  final int numLegs;

  // Programming Concept 2: Constructor - initializes object attributes.
  Animal({
    required this.name,
    required this.kingdom,
    required this.dob,
    required this.numLegs,
  });

  // Programming Concept 3: Method with parameter - receives a direction value.
  void Walk(String direction) {
    // Programming Concept 4: Conditional statement - chooses output based on legs.
    if (numLegs <= 0) {
      print('$name has no legs, so it cannot walk.');
    } else {
      print('$name walks toward the $direction.');
    }
  }

  String displayInfo() {
    return 'Name: $name\n'
        'Kingdom: $kingdom\n'
        'Date of Birth: ${_formatDate(dob)}\n'
        'Number of Legs: $numLegs';
  }
}

// Programming Concept 5: Inheritance - Pet extends the Animal class.
class Pet extends Animal {
  final String nickname;
  int kindness;

  Pet({
    required super.name,
    required super.kingdom,
    required super.dob,
    required super.numLegs,
    required this.nickname,
  }) : kindness = 100;

  Pet.withoutNickname({
    required super.name,
    required super.kingdom,
    required super.dob,
    required super.numLegs,
  }) : nickname = 'No nickname',
       kindness = 0;

  void Kick(int amount) {
    kindness -= amount;
    print('$nickname was kicked. Kindness decreased by $amount.');
    print('Current kindness: $kindness');
  }

  void pet(int amount) {
    if (kindness < 0) {
      print('Petting $nickname failed because kindness is below 0.');
    } else {
      kindness += amount;
      print('$nickname was petted. Kindness increased by $amount.');
      print('Current kindness: $kindness');
    }
  }

  void feed(int amount) {
    kindness += amount;
    print('$nickname was fed. Kindness increased by $amount.');
    print('Current kindness: $kindness');
  }

  // Programming Concept 6: Method overriding - customizes inherited behavior.
  @override
  String displayInfo() {
    return '${super.displayInfo()}\n'
        'Nickname: $nickname\n'
        'Kindness: $kindness';
  }
}

String _formatDate(DateTime date) {
  final month = date.month.toString().padLeft(2, '0');
  final day = date.day.toString().padLeft(2, '0');
  return '${date.year}-$month-$day';
}

void main() {
  // Programming Concept 7: List - stores multiple Animal objects.
  final ZOO = <Animal>[
    Animal(
      name: 'Luna',
      kingdom: 'Mammalia',
      dob: DateTime(2020, 3, 12),
      numLegs: 4,
    ),
    Animal(name: 'Sky', kingdom: 'Aves', dob: DateTime(2021, 7, 4), numLegs: 2),
    Animal(
      name: 'Noodle',
      kingdom: 'Reptilia',
      dob: DateTime(2022, 5, 18),
      numLegs: 0,
    ),
    Animal(
      name: 'Bubbles',
      kingdom: 'Actinopterygii',
      dob: DateTime(2023, 1, 9),
      numLegs: 0,
    ),
    Animal(
      name: 'Hoppy',
      kingdom: 'Amphibia',
      dob: DateTime(2019, 11, 24),
      numLegs: 4,
    ),
  ];

  // Programming Concept 8: Loop - iterates through ZOO and calls functions.
  for (final animal in ZOO) {
    print('--- Animal Info ---');
    print(animal.displayInfo());
    animal.Walk('north');
    print('');
  }

  final PET_HOME = <Pet>[
    Pet(
      name: 'Max',
      kingdom: 'Mammalia',
      dob: DateTime(2020, 8, 16),
      numLegs: 4,
      nickname: 'Buddy',
    ),
    Pet.withoutNickname(
      name: 'Mimi',
      kingdom: 'Mammalia',
      dob: DateTime(2021, 2, 14),
      numLegs: 4,
    ),
    Pet(
      name: 'Rio',
      kingdom: 'Aves',
      dob: DateTime(2022, 10, 8),
      numLegs: 2,
      nickname: 'Tweety',
    ),
  ];

  print('--- Pet Home Activities ---');

  // Programming Concept 9: Object interaction - calls behavior on Pet objects.
  PET_HOME[0].Kick(130);
  PET_HOME[0].pet(50);
  print(PET_HOME[0].displayInfo());
  print('');

  PET_HOME[1].Kick(40);
  PET_HOME[1].feed(1100);
  print(PET_HOME[1].displayInfo());
  print('');

  PET_HOME[2].pet(950);
  PET_HOME[2].feed(25);
  print(PET_HOME[2].displayInfo());
}
