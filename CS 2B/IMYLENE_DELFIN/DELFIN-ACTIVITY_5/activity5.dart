// ==============================
// Programming Concepts Used:
// 1. Classes and Objects
// 2. Inheritance
// 3. Constructors
// 4. Lists
// 5. Loops (for loop)
// 6. Conditional Statements (if-else)
// 7. Method Overriding (conceptual use)
// 8. Encapsulation
// ==============================

// PART 1: Animal Class
class Animal {
  String name;
  String kingdom;
  String dob;
  int numlegs;

  // Constructor
  Animal(this.name, this.kingdom, this.dob, this.numlegs);

  // Walk method
  void walk(String direction) {
    if (numlegs <= 0) {
      print("$name can't walk.");
    } else {
      print("$name walks towards $direction.");
    }
  }

  // displayInfo method
  String displayInfo() {
    return "Name: $name | Kingdom: $kingdom | DOB: $dob | Legs: $numlegs";
  }
}

// PART 2: Pet Class (inherits Animal)
class Pet extends Animal {
  String? nickname;
  int kindness;

  // Constructor WITHOUT nickname
  Pet(String name, String kingdom, String dob, int numlegs)
      : nickname = null,
        kindness = 0,
        super(name, kingdom, dob, numlegs);

  // Constructor WITH nickname
  Pet.withNickname(
      String name, String kingdom, String dob, int numlegs, String nickname)
      : nickname = nickname,
        kindness = 100, // positive start
        super(name, kingdom, dob, numlegs);

  // Kick method (decrease kindness)
  void kick(int value) {
    kindness -= value;
    print("${nickname ?? name} was kicked! Kindness now: $kindness");
  }

  // Pet method (increase kindness)
  void petAction(int value) {
    if (kindness < 0) {
      print("${nickname ?? name} refuses affection. Petting failed.");
    } else {
      kindness += value;
      print("${nickname ?? name} is happy! Kindness now: $kindness");
    }
  }

  // Additional method (Feed)
  void feed(int value) {
    kindness += value;
    print("${nickname ?? name} was fed. Kindness now: $kindness");
  }
}

// PART 3: MAIN PROGRAM
void main() {
  // List of Animals
  List<Animal> zoo = [
    Animal("Lion", "Mammal", "2020-01-01", 4),
    Animal("Alligator", "Reptile", "2017-08-23", 4),
    Animal("Scarlet Macau", "Aves", "2021-11-05", 2),
    Animal("Fish", "Aquatic", "2022-07-20", 0),
    Animal("Koala", "Mammal", "2019-04-14", 4),
  ];

  print("=== ZOO ===");
  for (var animal in zoo) {
    print(animal.displayInfo());
    animal.walk("north");
  }

  // List of Pets
  List<Pet> petHome = [
    Pet.withNickname("Dog", "Mammal", "2020-02-02", 4, "Buddy"),
    Pet("Cat", "Mammal", "2021-06-06", 4),
    Pet.withNickname("Rabbit", "Mammal", "2022-01-01", 4, "Snow"),
  ];

  print("\n=== PET HOME ===");

  // Decrease kindness below 0
  petHome[0].kick(200); // Buddy becomes negative
  petHome[1].kick(50);  // Cat becomes negative

  // Increase kindness above 1000
  petHome[2].feed(1200);
  petHome[2].petAction(100);

  // Show behaviors
  for (var pet in petHome) {
    pet.walk("east");
    pet.petAction(50);
  }
}