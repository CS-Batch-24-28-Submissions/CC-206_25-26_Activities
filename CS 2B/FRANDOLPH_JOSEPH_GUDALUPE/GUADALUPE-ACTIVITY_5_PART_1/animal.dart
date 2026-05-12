// Concept: Constructing Classes
class Animal {
  // Concept: Data Types and Variable Initialization
  String name;
  String kingdom;
  String dob;
  int numlegs;

  // Concept: Constructor Shorthand
  Animal(this.name, this.kingdom, this.dob, this.numlegs);

  void walk(String direction) {
    // Concept: Conditionals (if-else steucture)
    if (numlegs > 0) {
      print(' $name is walking towards the $direction.'); // Condition 1
      print('\n');
    } else {
      print(' $name cannot walk because it has no legs.'); // Condition 2
      print('\n');
    }
  }

  String displayInfo() {
    return ' Name: $name\n Kingdom: $kingdom\n DOB: $dob\n Legs: $numlegs';
  }
}