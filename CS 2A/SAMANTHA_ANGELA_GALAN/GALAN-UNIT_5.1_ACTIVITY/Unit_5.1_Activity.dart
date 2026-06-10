//Concept #1 Classes:
// Animal class
class Animal {
  // Attributes of the Animal class
  String name;
  String kingdom;
  DateTime dob;
  int numLegs;

  //Concept #2 This operator:
  Animal(this.name, this.kingdom, this.dob, this.numLegs);

  //Concept #3 Named Function Parameters:
  // Walk Method
  void walk({required String direction}) {
    if (numLegs > 0) {
      print('$name walks to the $direction.');
    } else {
      print('$name can’t walk because it has no legs.');
    }
  }

  //Concept #4 Fat arrow
  // Method to display animal information
  String displayInfo() =>
      'Name: $name, Kingdom: $kingdom, DOB: ${dob.toIso8601String()}, Legs: $numLegs';
}

// Pet class extending from Animal class
class Pet extends Animal {
  // Pet class attributes
  String? nickname;
  //Concept #5 Variable initialization
  double kindness = 0;

  //Concept #6 Named Constructors
  // Constructor with nickname
  Pet.withNickname(
    String name,
    String kingdom,
    DateTime dob,
    int legs,
    this.nickname,
  ) : kindness = 50.0,
      super(name, kingdom, dob, legs);

  // Constructor excluding the pet nickname
  Pet.noNickname(String name, String kingdom, DateTime dob, int legs)
    : super(name, kingdom, dob, legs);

  // Kick Method to decrease kindness
  void kick(double decreaseValue) {
    kindness -= decreaseValue;
    print(
      'You kicked $name. Kindness decreased by $decreaseValue. Current Kindness: $kindness',
    );
  }

  // Pet Method to increase kindness
  void petAnimal(double increaseValue) {
    if (kindness < 0) {
      print('Action failed! $name is too upset to be petted.');
    } else {
      kindness += increaseValue;
      print(
        'You petted $name. Kindness increased by $increaseValue. Current Kindness: $kindness',
      );
    }
  }

  // Additional method to influence kindness
  void feedTreat(double boost) {
    kindness += boost;
    print(
      'You gave $name a treat! Kindness boosted by $boost. Total: $kindness',
    );
  }
}

void main() {
  // A list called ZOO containing 5 different Animal objects [cite: 32]
  List<Animal> ZOO = [
    Animal('Leo', 'Mammal', DateTime(2020, 5, 10), 4),
    Animal('Python', 'Reptile', DateTime(2022, 1, 15), 0),
    Animal('Eagle', 'Bird', DateTime(2021, 3, 22), 2),
    Animal('Shark', 'Fish', DateTime(2019, 11, 2), 0),
    Animal('Elephant', 'Mammal', DateTime(2015, 8, 30), 4),
  ];

  print('--- ZOO ANIMALS ---');
  // Concept #7 Looping
  for (var animal in ZOO) {
    print(animal.displayInfo());
    animal.walk(direction: 'North');
    print('---');
  }

  List<Pet> PET_HOME = [
    Pet.withNickname('Buddy', 'Mammal', DateTime(2023, 1, 1), 4, 'Bud'),
    Pet.noNickname('Goldie', 'Fish', DateTime(2024, 6, 12), 0),
    Pet.withNickname('Max', 'Mammal', DateTime(2021, 10, 5), 4, 'Maxy'),
  ];

  print('\n--- PET HOME INTERACTIONS ---');

  PET_HOME[0].kick(100.0);
  PET_HOME[0].petAnimal(10.0);

  PET_HOME[1].feedTreat(1500.0);
  PET_HOME[2].petAnimal(1200.0);
}
