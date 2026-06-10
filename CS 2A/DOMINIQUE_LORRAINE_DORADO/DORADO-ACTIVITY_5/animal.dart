class Animal {
  String name;
  String kingdom;
  DateTime dob;
  int numLegs;

  // Constructor: initializes all properties when an Animal object is created
  Animal(this.name, this.kingdom, this.dob, this.numLegs);

  // Method: defines behavior for walking depending on number of legs
  void walk(String direction) {
    if (numLegs == 0) {
      print("$name can’t walk because it has no legs.");
    } else {
      print("$name walks towards $direction.");
    }
  }

  // Method: returns a formatted string containing the animal's details
  String displayInfo() {
    return "Name: $name, Kingdom: $kingdom, Date of Birth: ${dob.toLocal().toIso8601String().split('T')[0]}, Number of Legs: $numLegs.";
  }
}