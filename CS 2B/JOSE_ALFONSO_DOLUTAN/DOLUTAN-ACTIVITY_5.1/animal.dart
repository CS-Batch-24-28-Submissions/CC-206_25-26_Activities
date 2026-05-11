class Animal { // Animal Class Declaration
  String name; // strings
  String kingdom;
  String dob;
  int numlegs; // integers
  String walkDirection;

  Animal(this.name, this.kingdom, this.dob, this.numlegs, this.walkDirection); // constructor

  void walk(String direction) { // Method for walk (uses direction parameter)
    
    if (numlegs <= 0) { // conditionals (if else error handling)
      print('$name cannot walk because it has no legs');
    } else {
      print('$name is going towards $direction');
    }

  }

  void displayInfo() {// Method for displaying all info
    print('Name: $name');
    print('Kingdom: $kingdom');
    print('Date of Birth: $dob');
  }
}