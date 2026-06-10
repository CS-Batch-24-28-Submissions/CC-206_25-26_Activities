// BASE CLASS animal
class Animal {
  // Attributes
  String name;
  String kingdom;
  DateTime dob;
  int numLegs;

  // Constructor
  Animal(this.name, this.kingdom, this.dob, this.numLegs);

  // Method: Walk
  void walk(String direction) {
    if (numLegs > 0) {
      print("$name walks towards $direction.");
    } else {
      print("$name can't walk because it has no legs.");
    }
  }

  // Method: displayInfo 
  String displayInfo() {
    String formattedDate = "${dob.month}/${dob.day}/${dob.year}"; // format date and remiove time
  return "Name: $name | Kingdom: $kingdom | DOB: $formattedDate | Legs: $numLegs";
}
}

// DERIVED CLASS: Pet
class Pet extends Animal {
  // Additional Attributes
  String? nickname;
  int kindness;

  // Constructor without nickname
  Pet(String name, String kingdom, DateTime dob, int numLegs)
      : nickname = null,
        kindness = 0,
        super(name, kingdom, dob, numLegs);

  // Constructor with nickname
  Pet.withNickname(
      String name,
      String kingdom,
      DateTime dob,
      int numLegs,
      String this.nickname)
      : kindness = 100, // positive initial value
        super(name, kingdom, dob, numLegs);

  // Method: Kick (decrease kindness)
  void kick(int value) {
    kindness -= value;
    print("$name was kicked! Kindness decreased by $value. Current: $kindness");
  }

  // Method: Pet (increase kindness)
  void petAnimal(int value) {
    if (kindness < 0) {
      print("$name is too upset. Petting failed.");
    } else {
      kindness += value;
      print("$name was petted! Kindness increased by $value. Current: $kindness");
    }
  }

  // Additional Method: Feed (increase kindness)
  void feed(int value) {
    kindness += value;
    print("$name was fed! Kindness increased by $value. Current: $kindness");
  }
}
// MAIN PROGRAM
void main() {
  // List of Animals (ZOO)
  List<Animal> ZOO = [
    Animal("Lion", "Mammal", DateTime(2018, 5, 10), 4),
    Animal("Snake", "Reptile", DateTime(2020, 3, 2), 0),
    Animal("Frog", "Amphibian", DateTime(2021, 7, 15), 4),
    Animal("Bird", "Aves", DateTime(2019, 11, 25), 2),
    Animal("Fish", "Aquatic", DateTime(2022, 1, 1), 0),
  ];

  print("=== ZOO ANIMALS ===");
  // Iterate through ZOO
  for (var animal in ZOO) {
    print(animal.displayInfo());
    animal.walk("north");
    print("");
  }

  // List of Pets (PET_HOME)
  List<Pet> PET_HOME = [
    Pet.withNickname("Dog", "Mammal", DateTime(2021, 6, 1), 4, "Buddy"),
    Pet("Cat", "Mammal", DateTime(2020, 8, 12), 4),
    Pet.withNickname("Parrot", "Bird", DateTime(2022, 2, 20), 2, "Polly"),
  ];

  print("=== PET HOME ===");

  // Decrease kindness below 0
  PET_HOME[0].kick(200);
  PET_HOME[1].kick(50);

  // Increase kindness above 1000
  PET_HOME[0].feed(1200);
  PET_HOME[2].petAnimal(1100);

  print("");

  // Display
  for (var pet in PET_HOME) {
    print(pet.displayInfo());
    print("Kindness Level: ${pet.kindness}");
    print("");
  }
}