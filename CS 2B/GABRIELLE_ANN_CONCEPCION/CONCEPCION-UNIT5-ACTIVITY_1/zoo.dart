  class Animal {
  String name;
  String kingdom;
  DateTime dob;
  int numLegs;

  Animal({
    required this.name,
    required this.kingdom,
    required this.dob,
    required this.numLegs,
  });

  void walk(String direction) {
    if (numLegs <= 0) {
      print("$name can't walk.");
    } else {
      print("$name walks $direction.");
    }
  }

  String displayInfo() {
    return "Name: $name | Kingdom: $kingdom | DOB: $dob | Legs: $numLegs";
  }
}

class Pet extends Animal {
  String? nickname;
  int kindness;

  // Constructor WITHOUT nickname
  Pet({
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

  // Constructor WITH nickname
  Pet.withNickname({
    required String name,
    required String kingdom,
    required DateTime dob,
    required int numLegs,
    required this.nickname,
  })  : kindness = 100,
        super(
          name: name,
          kingdom: kingdom,
          dob: dob,
          numLegs: numLegs,
        );

  void changeKindness(int value) {
    kindness += value;
  }

  @override
  String displayInfo() {
    return super.displayInfo() +
        " | Nickname: ${nickname ?? 'None'} | Kindness: $kindness";
  }
}

void main() {
  // ZOO list with 5 Animals
  List<Animal> ZOO = [
    Animal(name: "Lion", kingdom: "Mammal", dob: DateTime(2020), numLegs: 4),
    Animal(name: "Snake", kingdom: "Reptile", dob: DateTime(2021), numLegs: 0),
    Animal(name: "Frog", kingdom: "Amphibian", dob: DateTime(2019), numLegs: 4),
    Animal(name: "Bird", kingdom: "Avian", dob: DateTime(2022), numLegs: 2),
    Animal(name: "Fish", kingdom: "Aquatic", dob: DateTime(2023), numLegs: 0),
  ];

  print("=== ZOO ===");

  // Iterate ZOO and call functions
  for (var animal in ZOO) {
    print(animal.displayInfo());
    animal.walk("forward");
    print("");
  }

  // PET_HOME list with 2-3 Pets
  List<Pet> PET_HOME = [
    Pet.withNickname(
        name: "Dog",
        kingdom: "Mammal",
        dob: DateTime(2021),
        numLegs: 4,
        nickname: "Buddy"),
    Pet(
        name: "Cat",
        kingdom: "Mammal",
        dob: DateTime(2022),
        numLegs: 4),
    Pet.withNickname(
        name: "Parrot",
        kingdom: "Avian",
        dob: DateTime(2020),
        numLegs: 2,
        nickname: "Polly"),
  ];

  print("=== PET HOME ===");

  // Change kindness values
  PET_HOME[0].changeKindness(-200);   // below 0
  PET_HOME[1].changeKindness(-50);    // below 0
  PET_HOME[2].changeKindness(1200);   // above 1000

  // Display PET_HOME info
  for (var pet in PET_HOME) {
    print(pet.displayInfo());
  }
}