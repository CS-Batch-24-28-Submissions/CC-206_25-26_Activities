// LOSANES_MAREY_FLORNECE_UNIT_5.1_ACTIVITY
class Animal {
  //Attributes / Variables
  String name;
  String kingdom;
  String dob;
  int numlegs;

  //Constructor
  Animal(this.name, this.kingdom, this.dob, this.numlegs);

  // Method with Parameter
  void walk(String direction) {
    // Conditional Statement (if)
    if (numlegs <= 0) {
      print("$name can't walk because it has no legs.");
    } else {
      print("$name walks toward the $direction.");
    }
  }

  //returns a String
  String displayInfo() {
    return """
Animal Information:
Name: $name
Kingdom: $kingdom
Date of Birth: $dob
Number of Legs: $numlegs
""";
  }
}

// Inheritance
// Pet class extends Animal

class Pet extends Animal {
  String nickname;
  int kindness;

  // Constructor WITH nickname
  // Kindness starts positive
  Pet.withNickname(
    String name,
    String kingdom,
    String dob,
    int numlegs,
    this.nickname,
  )   : kindness = 50,
        super(name, kingdom, dob, numlegs);

  // Constructor WITHOUT nickname
  Pet.noNickname(
    String name,
    String kingdom,
    String dob,
    int numlegs,
  )   : nickname = "No Nickname",
        kindness = 0,
        super(name, kingdom, dob, numlegs);

  // Method: Kick
  // Decreases kindness
  void kick(int decreaseValue) {
    kindness -= decreaseValue;

    print(
        "You kicked $name. Kindness decreased by $decreaseValue.");
    print("Current Kindness: $kindness");
  }

  // Method: Pet
  // Increases kindness only if not below 0
  void pet(int increaseValue) {
    if (kindness < 0) {
      print("You tried to pet $name, but it failed.");
      print("$name no longer trusts you.");
    } else {
      kindness += increaseValue;

      print("You petted $name.");
      print("Kindness increased by $increaseValue.");
      print("Current Kindness: $kindness");
    }
  }

  
  // Custom Method
  // feedPet() increases kindness
  void feedPet(int increaseValue) {
    kindness += increaseValue;

    print("You fed $name.");
    print("$name feels happier!");
    print("Kindness increased by $increaseValue.");
    print("Current Kindness: $kindness");
  }

  // Method Overriding

  String displayInfo() {
    return """
Pet Information:
Name: $name
Nickname: $nickname
Kingdom: $kingdom
Date of Birth: $dob
Number of Legs: $numlegs
Kindness Level: $kindness
""";
  }
}


// MAIN PROGRAM
// ======================================================
void main() {
  // List
  // ZOO list containing 5 Animal objects
  List<Animal> zoo = [
    Animal("Lion", "Mammal", "2019-03-12", 4),
    Animal("Snake", "Reptile", "2021-08-15", 0),
    Animal("Dog", "Mammal", "2022-01-10", 4),
    Animal("Chicken", "Bird", "2020-06-18", 2),
    Animal("Fish", "Aquatic", "2023-09-22", 0),
  ];

  print(" ZOO ANIMALS ");

 
  // Looping
  // Iterate through ZOO and call functions
  for (var animal in zoo) {
    print(animal.displayInfo());
    animal.walk("north");
    print("----------------------");
  }

  // PET_HOME list with 3 Pet objects
  List<Pet> petHome = [
    Pet.withNickname(
        "Dog", "Mammal", "2021-04-10", 4, "Buddy"),
    Pet.withNickname(
        "Cat", "Mammal", "2022-07-11", 4, "Mingming"),
    Pet.noNickname(
        "Rabbit", "Mammal", "2023-01-15", 4),
  ];

  print("\n===== PET HOME =====");

  // Display pet information
  for (var pet in petHome) {
    print(pet.displayInfo());
  }

  print("\n===== PET INTERACTIONS =====");

  // Decrease kindness below 0
  petHome[0].kick(100); // Buddy becomes negative

  // Try petting after negative kindness
  petHome[0].pet(20);
  print("----------------------");

  // Increase kindness above 1000
  petHome[1].feedPet(1200); // Mingming above 1000

  print("----------------------");

  // Normal interaction
  petHome[2].pet(50);
}