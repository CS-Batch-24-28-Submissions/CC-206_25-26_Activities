// Programming Concept #1: Class Definition (OOP - Encapsulation)
class Animal {
  // Attributes
  String name;
  String kingdom;
  DateTime dob;
  int numlegs;

  // Programming Concept #2: Constructor
  Animal(this.name, this.kingdom, this.dob, this.numlegs);

  // Programming Concept #3: Method with parameter and conditional logic
  void walk(String direction) {
    if (numlegs == 0) {
      print("$name can't walk");
    } else {
      print("$name walks $direction");
    }
  }

  // Programming Concept #4: Method that returns a String
  String displayInfo() {
    return "Name: $name | Kingdom: $kingdom | DOB: ${dob.toString().split(' ')[0]} | Legs: $numlegs";
  }
}