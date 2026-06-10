// Unit 5.2 Activity
// Concepts used: Classes, Constructors, Methods, Lists, Inheritance,
// Iteration, Conditionals, Encapsulation, String Interpolation, Object Instantiation

// 1. Dart class named Animal
// Concept: Class definition
//  Base class: Animal
class Animal {
  // Concept: Attributes (Encapsulation)
  // a. Attributes:
  String name;
  String kingdom;
  DateTime dob;
  int numLegs;

  // Concept: Constructor
  // Constructors
  Animal(this.name, this.kingdom, this.dob, this.numLegs) {}

  // Concept: Method with Conditionals
  // b. Methods
  // Method: Walk
  void walk(String direction) {
    if (numLegs > 0) {
      // Concept: String Interpolation
      print("$name walked towards the $direction.");
    } else {
      print("$name can't walk because it has no legs.");
    }
  }

  // Concept: Method returning a Multiline String
  // Method: Display Info
  String displayInfo() {
    return '''
Animal: $name
Kingdom: $kingdom
Date of Birth: ${dob.toLocal().toString().split(' ')[0]}
Number of Legs: $numLegs''';
  }
}

// 2. Class Pet extends Animal
// Concept: Inheritance
// Extended class: Pet
class Pet extends Animal {
  // Concept: Attributes with Encapsulation
  // a. Attributes:
  String? nickname;
  int kindness;

  // Concept: Constructor with Initialization List
  // c. Other:
  // Constructor requiring the nickname of the pet
  Pet.withNickname(String name, String kingdom, DateTime dob, int numLegs, this.nickname)
    : kindness = 30, // initial value of the kindness
      super(name, kingdom, dob, numLegs);

  // Concept: Overloaded Constructor
  // Constructor excluding the pet nickname
  Pet.noNickname(String name, String kingdom, DateTime dob, int numLegs)
    : kindness = 0,
      super(name, kingdom, dob, numLegs);

  // Concept: Method with Decrement Logic
  // b. Methods
  // Method: Kick
  void kick(int decreaseValue) {
    kindness -= decreaseValue;
  print('''
$name was kicked!
Kindness was decreased by $decreaseValue.
Current kindness: $kindness
''');
  }

  // Concept: Method with Conditionals
  // Method: Pet
  void pet(int increaseValue) {
    if (kindness < 0) {
  print('''
Petting failed!
$name's kindness is below 0.''');
    } else {
      kindness += increaseValue;
  print('''
$name was successfully petted!
Kindness was increased by $increaseValue.
Current kindness: $kindness
''');
    }
  }

  // Concept: Extra Method
  // Another method: Play
  void play(int increaseValue) {
    kindness += increaseValue;
  print('''
$name played happily!
Kindness was increased by $increaseValue.
Current kindness: $kindness
''');
  }

  // Concept: Method Override
  // Adds pet's nickname if there is
  @override
  String displayInfo() {
    String displayName = nickname != null ? "$name ($nickname)" : "$name (no nickname)";
  return '''
Pet: $displayName
Kingdom: $kingdom
Date of Birth: ${dob.toLocal().toString().split(' ')[0]}
Number of Legs: $numLegs
Kindness: $kindness''';
  }
}

// 3. Simple Dart Program
// Concept: Object Instantiation and Lists
// Main Program
void main() {
  // Concept: List of Objects
  // ZOO list containing 5 different Animal objects
  print("");
  List<Animal> ZOO = [
    Animal("Tiger", "Mammal", DateTime(2020, 8, 24), 4),
    Animal("Owl", "Bird", DateTime(2023, 4, 10), 2),
    Animal("Fish", "Aquatic", DateTime(2021, 2, 19), 0),
    Animal("Elephant", "Mammal", DateTime(2024, 9, 2), 4),
    Animal("Spider", "Arachnid", DateTime(2022, 11, 29), 8),
  ];

  // Concept: Iteration using for loop
  // Iterate through Z00 and call functions
  for (var animal in ZOO) {
    animal.walk("south");
    print(animal.displayInfo());
    print("");
  }

  print("\n--- PET HOME ---");
  print("");

  // Concept: List of Pet Objects
  // PET_HOME list containing 2-3 different Pet objects
  List<Pet> PET_HOME = [
    Pet.withNickname("Dog", "Mammal", DateTime(2025, 10, 22), 4, "Lala"),
    Pet.noNickname("Goldfish", "Aquatic", DateTime(2021, 2, 14), 0),
    Pet.withNickname("Cat", "Mammal", DateTime(2019, 5, 3), 4, "Luna"),
    Pet.noNickname("Snake", "Reptile", DateTime(2017, 9, 11), 0),
  ];

  // Concept: Method calls manipulating attributes
  // Manipulate kindness values
  PET_HOME[0].kick(20); // decrease kindness below 0
  PET_HOME[1].kick(10); // decrease kindness
  PET_HOME[2].play(1300); // increase kindness above 1000
  PET_HOME[3].pet(1500); // increase kindness above 1000

  // Concept: Iteration with output
  // Show kindness results
  for (var pet in PET_HOME) {
    print("");
    print(pet.displayInfo());
  }
}