// Concept 1: Classes and Objects
// Concept 2: Inheritance
// Concept 3: Method Overriding
// Concept 4: Constructors (Named and Default)
// Concept 5: Encapsulation (Private variables)
// Concept 6: Lists and Collections
// Concept 7: Iteration (Loops)
// Concept 8: Conditional Logic
// Concept 9: String Interpolation
// Concept 10: Null Safety (Optional Parameters)

class Animal {
  // Attributes 
  String name;
  String kingdom;
  String dob; // Date of Birth
  int numLegs;

  Animal(this.name, this.kingdom, this.dob, this.numLegs);

  // Walk Method
  void walk(String direction) {
    if (numLegs > 0) {
      print("$name is walking towards the $direction.");
    } else {
      print("$name has no legs and cannot walk.");
    }
  }

  // Display Summary 
  String displayInfo() {
    return "Animal: $name | Kingdom: $kingdom | DOB: $dob | Legs: $numLegs";
  }
}

// Pet class extending Animal 
class Pet extends Animal {
  String? nickname;
  double kindness = 0; // Set to 0 at start 

  // Constructor 1: Including Nickname
  Pet.withNickname(String name, String kingdom, String dob, int numLegs, this.nickname) 
      : super(name, kingdom, dob, numLegs) {
    kindness = 100.0; // Positive value if nicknamed 
  }

  // Constructor 2: Excluding Nickname
  Pet.noNickname(String name, String kingdom, String dob, int numLegs) 
      : super(name, kingdom, dob, numLegs);

  // Kick Method 
  void kick(double decreaseValue) {
    kindness -= decreaseValue;
    print("You kicked $name (Nickname: ${nickname ?? 'None'}). Kindness decreased by $decreaseValue to $kindness.");
  }

  // Pet Method 
  void petPet(double increaseValue) {
    if (kindness < 0) {
      print("Action failed: $name is too upset to be petted (Kindness: $kindness).");
    } else {
      kindness += increaseValue;
      print("You petted $name! Kindness increased to $kindness.");
    }
  }

  // Custom Method: Feed
  void feed(double foodQuality) {
    kindness += foodQuality;
    print("Feeding $name... Kindness is now $kindness.");
  }
}

void main() {
  // 3a. List ZOO with 5 Animal objects 
  List<Animal> ZOO = [
    Animal("Lion", "Mammalia", "2020-05-12", 4),
    Animal("Eagle", "Aves", "2021-08-20", 2),
    Animal("Snake", "Reptilia", "2022-01-10", 0),
    Animal("Elephant", "Mammalia", "2015-11-30", 4),
    Animal("Shark", "Chondrichthyes", "2019-03-15", 0),
  ];

  print("--- ZOO RECORDS ---");
  for (var animal in ZOO) {
    print(animal.displayInfo());
    animal.walk("North");
  }

  // 3b. List PET_HOME
  List<Pet> PET_HOME = [
    Pet.withNickname("Dog", "Canine", "2023-01-01", 4, "Buddy"),
    Pet.noNickname("Cat", "Feline", "2022-06-15", 4),
    Pet.withNickname("Parrot", "Avian", "2020-10-10", 2, "Rio"),
  ];

  print("\n--- PET INTERACTION ---");
  
  // Decrease kindness below 0
  PET_HOME[0].kick(150);
  PET_HOME[0].petPet(10); // Should fail

  // Increase kindness above 1000
  PET_HOME[1].feed(1500);
  PET_HOME[2].petPet(1200);
}