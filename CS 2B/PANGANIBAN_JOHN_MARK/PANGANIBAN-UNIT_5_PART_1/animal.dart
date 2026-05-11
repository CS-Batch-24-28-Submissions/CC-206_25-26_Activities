class Animal {
  String name;
  String kingdom;
  String dob; // date of birth
  int numLegs; // number of legs

  // CONCEPT USED (CU): Constructor Shorthand
  Animal (this.name, this.kingdom, this.dob, this.numLegs) {
    if (numLegs < 0) { numLegs = 0; }
  }

  void walk(Direction direction) {
    // CONCEPT USED (CU): Conditionals
    if (numLegs <= 0) {
      print("$name can't walk because it has no legs");
    } else {
      print("$name is walking ${direction.name}");
    }
  }

  // CONCEPT USED (CU): Multiline Strings
  String displayInfo() =>
    """
    $name's Information:
      - Kingdom: $kingdom
      - Date of Birth: $dob
      - Number of Legs: $numLegs
    """;
  
}

class AnimalBuilder {

  // CONCEPT USED (CU): List
  // CONCEPT USED (CU): Big Arrow
  List<Animal> buildFiveAnimals() => [
    Animal('Shark', 'Animalia', '1999', 0),
    Animal('Dog', 'Animalia', '1998', 4),
    Animal('Cat', 'Animalia', '1997', 4),
    Animal('Eagle', 'Animalia', '2001', 2),
    Animal('Snake', 'Animalia', '2000', 0),
  ];
}

enum Direction {
  north("North"),
  south("South"),
  west("West"),
  east("East");

  final String name;
  const Direction(this.name);
}