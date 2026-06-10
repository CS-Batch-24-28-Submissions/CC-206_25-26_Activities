// Animal Class

//1. Constucting Class
//2. Variable Initialization
class Animal {
  String name;
  String kingdom;
  String dob;
  int numLeg;

  //3. Constructor Shorthand
  Animal(this.name, this.kingdom, this.dob, this.numLeg) {}

  //3. Conditionals
  void walk(String direction) {
    if (numLeg >= 1) {
      print("$name walks towards $direction");
    } else {
      print("It can't walk");
    }
  }

  //5.Multiline Strings
  String displayInfo() {
    return """
            Name: $name
            Kingdom: $kingdom
            Date of Birth: $dob
            Number of Legs: $numLeg
            """;
  }
}
