// ========== [ SANTOS - Activity 5.1 ] ==========

// CONCEPT #1: Constructing Classes
class Animal {
  //a. Attributes:
  String name = "Dog";
  String kingdom = "Animalia";

  // CONCEPT #2 Variable Initialization
  String dob;
  int numLegs;

  // Constructor
  Animal({
    // CONCEPT #3: Constructor Shorthand
    required this.name,
    required this.kingdom,
    required this.dob,
    required this.numLegs,
  });

  // b. Methods

  // Walk - print direction if animal has legs
  void walk(String direction) {
    if (numLegs > 0) {
      print("$name walks $direction.");
    } else {
      print("$name can’t walk.");
    }
  }

  // displayInfo - returns Animal info

  //  CONCEPT #4: Big Fat Arrow
  String displayInfo() =>
      //  CONCEPT #5: Multiline Strings
      """
    Name: $name
    Kingdom: $kingdom
    DOB: $dob
    Number of legs: $numLegs
    """;
}
