void main() {
  // ==========================================
  // PART 3a: ZOO List & Iteration
  // ==========================================

  // CONCEPT 1: Type Inference & CONCEPT 2: Lists and Arrays
  // Dart infers types automatically using 'var', and lists contain collections of items.
  var ZOO = [
    Animal("Lion", "Mammalia", "2018-05-12", 4),
    Animal("Python", "Reptilia", "2020-11-20", 0), // No legs
    Animal("Eagle", "Aves", "2019-01-15", 2),
    Animal("Tarantula", "Arachnida", "2022-10-31", 8),
    Animal("Dolphin", "Mammalia", "2015-08-08", 0), // No legs
  ];

  print("--- WELCOME TO THE ZOO ---");

  // CONCEPT 3: Looping
  // Iterating through the ZOO list.
  for (var animal in ZOO) {
    print(animal.displayInfo());
    animal.walk("North");
    print("--------------------------");
  }

  // ==========================================
  // PART 3b: PET_HOME List & Interactions
  // ==========================================
  print("\n--- PET HOME INTERACTIONS ---");

  var PET_HOME = [
    Pet.withNickname("Dog", "Mammalia", "2021-03-10", 4, "Buddy"),
    Pet.withoutNickname("Cat", "Mammalia", "2022-07-22", 4),
    Pet.withNickname("Parrot", "Aves", "2020-02-14", 2, "Rio"),
  ];

  // CONCEPT 4: Cascading Operator
  // The ".." allows you to perform multiple operations on the same object.

  // i. Decrease the kindness value of 1-2 pets below 0
  print("\n[ Interacting with Buddy the Dog ]");
  PET_HOME[0]
    ..kick(15) // Decreases kindness to below 0 (Starts at 10, minus 15 = -5)
    ..petGesture(5); // Will fail because kindness is now below 0

  // ii. Increase the kindness value of 1-2 pets above 1000
  print("\n[ Interacting with the un-named Cat ]");
  PET_HOME[1]
    ..feedTreat(500) // Starts at 0, goes to 500
    ..feedTreat(550); // Goes to 1050 (above 1000)

  print("\n[ Interacting with Rio the Parrot ]");
  PET_HOME[2]..petGesture(995); // Starts at 10, goes to 1005 (above 1000)
}

// ==========================================
// PART 1: Animal Class
// ==========================================
class Animal {
  String name;
  String kingdom;
  String dob;
  int numLegs;

  // CONCEPT 5: Constructor Shorthand
  // Using 'this.property' directly in the constructor avoids boilerplate.
  Animal(this.name, this.kingdom, this.dob, this.numLegs);

  void walk(String direction) {
    // CONCEPT 6: Conditionals
    // Simple if/else control flow.
    if (numLegs == 0) {
      print("$name can't walk because it has no legs.");
    } else {
      print("$name is walking towards the $direction.");
    }
  }

  // CONCEPT 7: Big arrow/Fat arrow & CONCEPT 8: Multiline Strings
  // Used for a single-line return statement combined with """ for multiline strings.
  String displayInfo() =>
      """
  Animal Info Summary:
  Name: $name
  Kingdom: $kingdom
  DOB: $dob
  Legs: $numLegs""";
}

// ==========================================
// PART 2: Pet Class
// ==========================================
class Pet extends Animal {
  // CONCEPT 9: Variable Initialization
  // Variables can be uninitialized, though modern Dart requires null-safety handling (String?).
  String? nickname;
  int kindness = 0;

  // CONCEPT 10: Named Constructors
  // Dart does not support overloading constructors, so we use named constructors instead.

  // Constructor 1: Requires nickname, initializes kindness to a positive number (10).
  Pet.withNickname(
    String name,
    String kingdom,
    String dob,
    int numLegs,
    this.nickname,
  ) : kindness = 10,
      super(name, kingdom, dob, numLegs);

  // Constructor 2: Excludes nickname.
  Pet.withoutNickname(String name, String kingdom, String dob, int numLegs)
    : super(name, kingdom, dob, numLegs);

  void kick(int decreaseValue) {
    kindness -= decreaseValue;
    String target =
        nickname ?? name; // Fallback to species name if no nickname exists
    print(
      "*You kicked $target!* Kindness decreased by $decreaseValue. Current kindness: $kindness",
    );
  }

  void petGesture(int increaseValue) {
    String target = nickname ?? name;
    if (kindness < 0) {
      print(
        "*You tried to pet $target, but it failed!* The pet is too hostile. Current kindness: $kindness",
      );
    } else {
      kindness += increaseValue;
      print(
        "*You pet $target!* Kindness increased by $increaseValue. Current kindness: $kindness",
      );
    }
  }

  // Custom Method: Feeds a treat to the pet
  void feedTreat(int increaseValue) {
    kindness += increaseValue;
    String target = nickname ?? name;
    print(
      "*You fed a treat to $target!* Kindness increased by $increaseValue. Current kindness: $kindness",
    );
  }
}
