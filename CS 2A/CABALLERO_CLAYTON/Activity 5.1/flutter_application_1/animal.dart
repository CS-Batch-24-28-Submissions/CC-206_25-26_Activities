class Animal {
  String name;
  String kingdom;
  DateTime dob;
  int numbLegs;

  //Constructor
  Animal(this.name, this.kingdom, this.dob, this.numbLegs);

  //Walk
  void walk(String direction) {
    if (numbLegs <= 0) {
      print("$name can't walk because it has no legs.");
    } else {
      print("$name walks towards $direction.");
    }
  }

  //display Info
  String displayInfo() {
    return "Name: $name | Kingdom: $kingdom | DOB: $dob | Legs: $numbLegs";
  }
}
