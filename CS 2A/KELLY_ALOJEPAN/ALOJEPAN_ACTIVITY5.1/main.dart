// ==========================================
// PROGRAMMING CONCEPTS USED:
// 1. Main Entry Point (main function)
// 2. Dart Syntax and Semantics
// 3. Data Types (String, int, DateTime)
// 4. Lists (Arrays)
// 5. Conditional Statements (if-else)
// 6. Looping (for loop)
// 7. Constructing Classes
// 8. Type Inference (var)
// 9. Variable Initialization
// 10. Named Function Parameters
// 11. This Keyword
// 12. Named Constructors
// ==========================================

// 7. CONSTRUCTING CLASSES
class Animal {
  // 3. DATA TYPES + 9. VARIABLE INITIALIZATION
  String name;
  String kingdom;
  DateTime dob;
  int numLegs;

  // 10. NAMED FUNCTION PARAMETERS + 11. THIS KEYWORD
  Animal({
    required this.name,
    required this.kingdom,
    required this.dob,
    required this.numLegs,
  });

  // 5. CONDITIONAL STATEMENTS
  void walk(String direction) {
    if (numLegs <= 0) {
      print("$name can't walk because it has no legs.");
    } else {
      print("$name walks towards $direction.");
    }
  }

  String displayInfo() {
    // 2. DART SYNTAX + MULTILINE STRING
    return """Name: $name
Kingdom: $kingdom
DOB: ${dob.toLocal().toString().split(' ')[0]}
Legs: $numLegs""";
  }
}

class Pet extends Animal {
  String? nickname;
  int kindness;

  // 12. NAMED CONSTRUCTOR (with nickname)
  Pet.withNickname({
    required String name,
    required String kingdom,
    required DateTime dob,
    required int numLegs,
    required this.nickname,
  })  : kindness = 10,
        super(
          name: name,
          kingdom: kingdom,
          dob: dob,
          numLegs: numLegs,
        );

  // 12. NAMED CONSTRUCTOR (without nickname)
  Pet.noNickname({
    required String name,
    required String kingdom,
    required DateTime dob,
    required int numLegs,
  })  : nickname = null,
        kindness = 0,
        super(
          name: name,
          kingdom: kingdom,
          dob: dob,
          numLegs: numLegs,
        );

  void kick(int value) {
    kindness -= value;
    print("${nickname ?? name} was kicked! Kindness: $kindness");
  }

  // 5. CONDITIONAL
  void petAnimal(int value) {
    if (kindness < 0) {
      print("${nickname ?? name} is upset. Petting failed.");
    } else {
      kindness += value;
      print("${nickname ?? name} is happy! Kindness: $kindness");
    }
  }

  void feed(int value) {
    kindness += value;
    print("${nickname ?? name} was fed! Kindness: $kindness");
  }
}

// 1. MAIN ENTRY POINT
void main() {
  // 4. LISTS + 8. TYPE INFERENCE
  var ZOO = [
    Animal(name: "Dog", kingdom: "Animalia", dob: DateTime(2020, 1, 1), numLegs: 4),
    Animal(name: "Snake", kingdom: "Reptilia", dob: DateTime(2021, 3, 10), numLegs: 0),
    Animal(name: "Bird", kingdom: "Aves", dob: DateTime(2019, 5, 5), numLegs: 2),
    Animal(name: "Spider", kingdom: "Arachnida", dob: DateTime(2022, 7, 7), numLegs: 8),
    Animal(name: "Fish", kingdom: "Aquatic", dob: DateTime(2018, 9, 9), numLegs: 0),
  ];

  print("=== ZOO ===");

  // 6. LOOPING
  for (var animal in ZOO) {
    print(animal.displayInfo());
    animal.walk("north");
    print("------------------");
  }

  var PET_HOME = [
    Pet.withNickname(
      name: "Dog",
      kingdom: "Animalia",
      dob: DateTime(2022, 1, 1),
      numLegs: 4,
      nickname: "Buddy",
    ),
    Pet.withNickname(
      name: "Cat",
      kingdom: "Animalia",
      dob: DateTime(2021, 2, 2),
      numLegs: 4,
      nickname: "Ming",
    ),
    Pet.noNickname(
      name: "Parrot",
      kingdom: "Aves",
      dob: DateTime(2020, 3, 3),
      numLegs: 2,
    ),
  ];

  print("\n=== PET HOME ===");

  // Make kindness NEGATIVE
  PET_HOME[0].kick(100);
  PET_HOME[1].kick(200);

  // Make kindness ABOVE 1000
  PET_HOME[1].feed(1500);
  PET_HOME[2].feed(2000);

  // 6. LOOPING
  for (var pet in PET_HOME) {
    print("------------------");
    print(pet.displayInfo());
    print("Nickname: ${pet.nickname ?? 'None'}");
    print("Kindness: ${pet.kindness}");
  }
}