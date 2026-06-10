// CONCEPT: Constructing Class
class Animal {
  // CONCEPT: Variables and Type Inference (explicit types used)
  String name;
  String kingdom;
  DateTime dob;
  int numLegs;

  // CONCEPT: Constructor Shorthand
  Animal(this.name, this.kingdom, this.dob, this.numLegs);

  // CONCEPT: Conditionals (if-else)
  void walk(String direction) {
    if (numLegs <= 0) {
      print("$name can't walk because it has no legs.");
    } else {
      print("$name is walking towards the $direction.");
    }
  }

  // CONCEPT: Multiline String
  String displayInfo() {
    return "Animal Info - \n"
        "Name: $name \n"
        "Kingdom: $kingdom \n"
        "DOB: ${dob.toLocal().toString().split(' ')[0]} \n"
        "Legs: $numLegs";
  }
}

// CONCEPT: Inheritance + Constructing Class
class Pet extends Animal {
  // CONCEPT: Variable Initialization
  String? nickname;
  int kindness;

  // CONCEPT: Named Constructors
  Pet.withoutNickname(String name, String kingdom, DateTime dob, int numLegs)
      : kindness = 0,
        super(name, kingdom, dob, numLegs);

  // CONCEPT: Named Constructors
  Pet.withNickname(
    String name,
    String kingdom,
    DateTime dob,
    int numLegs,
    this.nickname,
  ) : kindness = 50,
      super(name, kingdom, dob, numLegs);

  // CONCEPT: Variables + Assignment
  void kick(int decreaseValue) {
    kindness -= decreaseValue;
    print("You kicked $name. Kindness is now $kindness.");
  }

  // CONCEPT: Conditionals
  void pet(int increaseValue) {
    if (kindness < 0) {
      print("Failed to pet $name. Kindness is too low ($kindness).");
    } else {
      kindness += increaseValue;
      print("You petted $name. Kindness is now $kindness.");
    }
  }

  // CONCEPT: Method + Variable Manipulation
  void feedTreat(int value) {
    kindness += value;
    print("${nickname ?? name} enjoyed a treat! Kindness is now $kindness.");
  }

  // CONCEPT: Multiline String + Method Override
  @override
  String displayInfo() {
    return "${super.displayInfo()} \n"
        "Nickname: ${nickname ?? 'None'} \n"
        "Kindness: $kindness";
  }
}

// CONCEPT: Entry Point
void main() {
  // CONCEPT: List and Arrays
  List<Animal> ZOO = [
    Animal("Lion", "Animalia", DateTime(2018, 5, 12), 4),
    Animal("Python", "Animalia", DateTime(2020, 8, 20), 0),
    Animal("Eagle", "Animalia", DateTime(2019, 3, 15), 2),
    Animal("Dolphin", "Animalia", DateTime(2015, 11, 2), 0),
    Animal("Elephant", "Animalia", DateTime(2010, 7, 24), 4),
  ];

  print("=== ZOO ===");

  // CONCEPT: Looping (for-in loop)
  for (var animal in ZOO) { // CONCEPT: Type Inference (var)
    print(animal.displayInfo());
    print("");
    animal.walk("North");
    print("----------------------");
  }

  // CONCEPT: List and Arrays
  List<Pet> PET_HOME = [
    Pet.withNickname("Dog", "Animalia", DateTime(2021, 1, 1), 4, "Buddy"),
    Pet.withNickname("Cat", "Animalia", DateTime(2022, 2, 2), 4, "Luna"),
    Pet.withoutNickname("Parrot", "Animalia", DateTime(2023, 3, 3), 2),
  ];

  print("\n=== PET HOME ===");

  // CONCEPT: Looping (for-in loop)
  for (var pet in PET_HOME) { // CONCEPT: Type Inference (var)
    print(pet.displayInfo());
    print("----------------------");
  }

  print("\n-- Manipulating Dog --");
  PET_HOME[0].kick(100);
  PET_HOME[0].pet(20);

  print("\n-- Manipulating Cat --");
  PET_HOME[1].feedTreat(1000);
  PET_HOME[1].pet(50);

  print("\n-- Manipulating Parrot --");
  PET_HOME[2].feedTreat(20);
}

