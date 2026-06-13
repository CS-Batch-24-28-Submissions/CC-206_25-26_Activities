// CONCEPT USED (CU): Constructing Classes
class Animal {
  String name;
  String kingdom;
  String dob;
  int numLegs;

  // CU: Constructor Shorthand
  Animal(this.name, this.kingdom, this.dob, this.numLegs);

  // CU: Conditionals
  void walk(String direction) {
    if (numLegs <= 0) {
      print("$name can't walk because it has no legs.");
    } else {
      print("$name is walking towards $direction.");
    }
  }

  // CU: Multiline String (Using Triple Quotes)
  String displayInfo() {
    return ''' 
    Animal Info:
    - Name: $name
    - Kingdom: $kingdom
    - DOB: $dob
    - Legs: $numLegs
    ''';
  }
}