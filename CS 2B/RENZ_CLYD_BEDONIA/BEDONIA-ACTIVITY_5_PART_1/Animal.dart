// Animal Class

// CONCEPT 5: Constructing Classes. Building the blueprint for the Animal.
class Animal {
  // CONCEPT 6: Data Types. Variable declaration using Strings and Integers.
  String name;
  String kingdom;
  String dob;
  int numLegs;

  // CONCEPT 7: Constructor Shorthand. The parameters are automatically assigned using "this.".
  Animal(this.name, this.kingdom, this.dob, this.numLegs);

  // CONCEPT 8: Map<foo, bar>. Maps the movement and response for the chosen direction.
  Map<String, String> movements = {
    "forward": "moved forward",
    "back": "moved back",
    "left": "moved left",
    "right": "moved right",
  };

  // Animal methods

  // Function for animal walk
  void walk(String direction) {
    // CONCEPT 9: Conditionals. Using a traditional if/else statement to check for the no. of legs.
    if (numLegs <= 0) {
      print("There seems to be a mistake, the $name cannot walk.");
      return;
    }

    // Action message variable
    String? actionMessage = movements[direction];

    // Direction validation conditional
    if (actionMessage != null) {
      print("The $name $actionMessage");
    } else {
      print("The $name is confused, '$direction' is not a valid direction.");
    }
  }

  // Function for displaying animal info
  void displayInfo() {
    String info =
        """
========== Animal Info =========
Name:             $name
Kingdom:          $kingdom
Date of Birth:    $dob
Number of Legs:   $numLegs
""";
    print(info);
  }
}
