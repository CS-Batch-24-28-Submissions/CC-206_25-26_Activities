// Unit 5 Part 1 Activity - Dart OOP

// CONCEPT 1: Class Definition
class Animal {
  // CONCEPT 2: Instance Variables / Attributes
  String name;
  String kingdom;
  String dob;
  int numLegs;

  // CONCEPT 3: Constructor
  Animal({
    required this.name,
    required this.kingdom,
    required this.dob,
    required this.numLegs,
  });

  // CONCEPT 4: Methods
  void walk(String direction) {
    // CONCEPT 5: Conditional Statement
    if (numLegs == 0) {
      print("$name can't walk.");
    } else {
      print("$name is walking towards $direction.");
    }
  }

  // Method that returns a String
  String displayInfo() {
    return """
--- Animal Info ---
Name    : $name
Kingdom : $kingdom
DOB     : $dob
Legs    : $numLegs
""";
  }
}

// CONCEPT 6: Inheritance - Pet extends Animal
class Pet extends Animal {
  // CONCEPT 7: Optional / nullable attribute
  String? nickname;
  int kindness;

  // Constructor WITH nickname (sets kindness to positive number)
  Pet.withNickname({
    required super.name,
    required super.kingdom,
    required super.dob,
    required super.numLegs,
    required this.nickname,
  }) : kindness = 50; // Initial positive kindness when nickname is given

  // Constructor WITHOUT nickname (kindness starts at 0)
  Pet.withoutNickname({
    required super.name,
    required super.kingdom,
    required super.dob,
    required super.numLegs,
  })  : nickname = null,
        kindness = 0;

  // Decrease kindness value
  void kick(int amount) {
    kindness -= amount;
    print(
        "${nickname ?? name} was kicked! Kindness decreased by $amount. Current kindness: $kindness");
  }

  // Increase kindness if not below 0, otherwise fail
  void pet(int amount) {
    if (kindness < 0) {
      print(
          "Failed to pet ${nickname ?? name}. Kindness is too low ($kindness). Try feeding first!");
    } else {
      kindness += amount;
      print(
          "${nickname ?? name} was petted! Kindness increased by $amount. Current kindness: $kindness");
    }
  }

  // CONCEPT 8: Custom method - feed() increases kindness
  void feed(int amount) {
    kindness += amount;
    print(
        "${nickname ?? name} was fed! Kindness increased by $amount. Current kindness: $kindness");
  }

  // Override displayInfo to include pet-specific info
  @override
  String displayInfo() {
    return """
--- Pet Info ---
Name      : $name
Nickname  : ${nickname ?? "None"}
Kingdom   : $kingdom
DOB       : $dob
Legs      : $numLegs
Kindness  : $kindness
""";
  }
}

void main() {
  // CONCEPT 9: List (Collection)
  List<Animal> ZOO = [
    Animal(name: "Lion", kingdom: "Mammalia", dob: "2018-03-10", numLegs: 4),
    Animal(name: "Eagle", kingdom: "Aves", dob: "2020-06-15", numLegs: 2),
    Animal(name: "Python", kingdom: "Reptilia", dob: "2019-11-01", numLegs: 0),
    Animal(name: "Frog", kingdom: "Amphibia", dob: "2021-08-22", numLegs: 4),
    Animal(name: "Shark", kingdom: "Chondrichthyes", dob: "2015-01-30", numLegs: 0),
  ];

  print("========== ZOO ==========");
  // CONCEPT 10: For-in Loop (Iteration)
  for (Animal animal in ZOO) {
    print(animal.displayInfo());
    animal.walk("North");
    print("");
  }

  // Pet list
  List<Pet> PET_HOME = [
    Pet.withNickname(
      name: "Labrador",
      kingdom: "Mammalia",
      dob: "2022-04-05",
      numLegs: 4,
      nickname: "Reimu",
    ),
    Pet.withNickname(
      name: "Persian Cat",
      kingdom: "Mammalia",
      dob: "2021-09-18",
      numLegs: 4,
      nickname: "Marisa",
    ),
    Pet.withoutNickname(
      name: "Parrot",
      kingdom: "Aves",
      dob: "2020-12-25",
      numLegs: 2,
    ),
  ];

  print("\n========== PET HOME ==========");
  for (Pet p in PET_HOME) {
    print(p.displayInfo());
  }

  // Decrease kindness of 2 pets below 0
  print("\n--- Decreasing kindness of Reimu and Marisa below 0 ---");
  PET_HOME[0].kick(100); // Reimu: 50 - 100 = -50
  PET_HOME[1].kick(200); // Marisa: 50 - 200 = -150

  // Try to pet them (should fail since kindness < 0)
  print("\n--- Trying to pet them (should fail) ---");
  PET_HOME[0].pet(10);
  PET_HOME[1].pet(10);

  // Feed them first to recover
  print("\n--- Feeding to recover ---");
  PET_HOME[0].feed(60);  // Reimu: -50 + 60 = 10
  PET_HOME[1].feed(200); // Marisa: -150 + 200 = 50

  // Now pet them (should succeed)
  print("\n--- Petting after recovery ---");
  PET_HOME[0].pet(20);
  PET_HOME[1].pet(30);

  // Increase kindness of 2 pets above 1000
  print("\n--- Increasing kindness above 1000 ---");
  PET_HOME[0].feed(1000); // Reimu
  PET_HOME[1].feed(1000); // Marisa
  PET_HOME[2].feed(1050); // Parrot

  print("\n--- Final Pet States ---");
  for (Pet p in PET_HOME) {
    print(p.displayInfo());
  }
}