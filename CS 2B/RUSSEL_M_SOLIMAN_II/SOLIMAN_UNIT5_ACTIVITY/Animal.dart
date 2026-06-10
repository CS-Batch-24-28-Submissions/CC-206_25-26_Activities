class Animal {
  final String name;
  final String kingdom;
  final DateTime dob;
  final int numLegs;

  //Creates Animal.
  Animal({
    required this.name,
    required this.kingdom,
    required this.dob,
    required this.numLegs,
  });

  void walk(String direction) {
    if (numLegs > 0) {
      print('$name walks $direction.');
    } else {
      print('$name can’t walk, it has no legs.');
    }
  }

  //Returns a formatted string
  String displayInfo() {
    return '''
      Name: $name
      Kingdom: $kingdom
      Date of Birth: ${dob.toIso8601String().split('T')[0]}
      Number of Legs: $numLegs''';
  }
}

class Pet extends Animal {
  final String? nickname;
  double kindness; 

  //Creates Pet with a nickname.
  //Initializes to a positive number
  Pet.withNickname({
    required String name,
    required String kingdom,
    required DateTime dob,
    required int numLegs,
    required this.nickname,
  })  : kindness = 100,
        super(name: name, kingdom: kingdom, dob: dob, numLegs: numLegs);

  //Creates Pet without a nickname.
  //Initializes [kindness] to 0
  Pet({
    required String name,
    required String kingdom,
    required DateTime dob,
    required int numLegs,
  })  : nickname = null,
        kindness = 0,
        super(name: name, kingdom: kingdom, dob: dob, numLegs: numLegs);

  @override
  String displayInfo() {
    final animalInfo = super.displayInfo();
    final nicknameLine = nickname != null ? 'Nickname: $nickname\n' : '';
    return '''$animalInfo
${nicknameLine}Kindness: ${kindness.toStringAsFixed(2)}''';
  }

  //Increases the pet's kindness
  void increaseKindness(double amount) {
    if (amount < 0) {
      print('Warning: Cannot increase kindness by a negative amount.');
      return;
    }
    kindness += amount;
    print('$name\'s kindness increased to ${kindness.toStringAsFixed(2)}.');
  }

  //Decreases the pet's kindness
  void decreaseKindness(double amount) {
    if (amount < 0) {
      print('Warning: Cannot decrease kindness by a negative amount.');
      return;
    }
    kindness -= amount;
    print('$name\'s kindness decreased to ${kindness.toStringAsFixed(2)}.');
  }
}

void main() {
  print('=== Animals in the Zoo ===');
  final ZOO1 = <Animal>[
    Animal(name: 'Lion', kingdom: 'Mammalia', dob: DateTime(2018, 1, 1), numLegs: 4),
    Animal(name: 'Fish', kingdom: 'Vertebrates', dob: DateTime(2020, 2, 25), numLegs: 0),
    Animal(name: 'Rooster', kingdom: 'Animalia', dob: DateTime(2017, 11, 5), numLegs: 2),
    Animal(name: 'Crocodile', kingdom: 'Reptilia', dob: DateTime(2015, 8, 1), numLegs: 4),
  ];

  for (var i = 0; i < ZOO1.length; i++) {
    final animal = ZOO1[i];
    print('\n--- Animal ${i + 1}: ${animal.name} ---');
    animal.walk(animal.numLegs > 0 ? 'around' : 'in the water');
    print(animal.displayInfo());
  }

  print('\n\n=== Pets at Home ===');
  final List<Pet> petHome = [
    Pet.withNickname(
        nickname: 'Buddy', kingdom: 'Animalia', dob: DateTime(2021, 3, 1), numLegs: 4, name: 'Dog'),
    Pet(name: 'Cat', kingdom: 'Animalia', dob: DateTime(2022, 7, 15), numLegs: 4),
    Pet.withNickname(
        nickname: 'Polly', kingdom: 'Animalia', dob: DateTime(2023, 1, 20), numLegs: 4, name: 'Pig'),
  ];

  print('\n--- Initial Pet Info ---');
  for (var i = 0; i < petHome.length; i++) {
    final pet = petHome[i];
    print('\n--- Pet ${i + 1}: ${pet.name} ---');
    pet.walk('around the house');
    print(pet.displayInfo());
  }

  // Decrease kindness
  print('\n--- Modifying Pet Kindness ---');
  print('Decreasing kindness for Buddy (Dog) and Cat...');
  petHome[0].decreaseKindness(600.0); // Buddy's kindness: 500 - 600 = -100
  petHome[1].decreaseKindness(50.0); // Cat's kindness: 0 - 50 = -50

  // Increase kindness
  print('\nIncreasing kindness for Polly (Pig) and Buddy (Dog)...');
  petHome[2].increaseKindness(1500.0); // Polly's kindness: 500 + 1500 = 2000
  petHome[0].increaseKindness(2000.0); // Buddy's kindness: -100 + 2000 = 1900

  print('\n--- Final Pet Info After Modifications ---');
  for (var i = 0; i < petHome.length; i++) {
    final pet = petHome[i];
    print('\n--- Pet ${i + 1}: ${pet.name} ---');
    pet.walk('playfully');
    print(pet.displayInfo());
  }
}