// CONCEPT: Variable Initialization to null
class Animal {
  String name;
  String kingdom;
  String dob;
  int numlegs;

  // CONCEPT: Named Function Parameters
  Animal({
    required this.name,
    required this.kingdom,
    required this.dob,
    required this.numlegs,
  });

  // Walk method
  void walk(String direction) {
    if (numlegs == 0) {
      print("$name can't walk");
    } else {
      print("$name walking $direction");
    }
  }

  String displayInfo() {
    // CONCEPT: Multiline Strings
    String animalInfo =
        """Animal Name: $name
Kingdom: $kingdom
Date of Birth: $dob
Number of legs: $numlegs""";
    return animalInfo;
  }
}

void main() {
  // CONCEPT: No more "new" keyword
  Animal cat = Animal(
    name: "Kuring",
    kingdom: "Animalia",
    dob: "June 7, 2020",
    numlegs: 4,
  );

  cat.walk("Right");

  print(cat.displayInfo());

  Animal fish = Animal(
    name: "Fishda",
    kingdom: "Animalia",
    dob: "June 7, 2020",
    numlegs: 0,
  );

  fish.walk("forward");

  print(fish.displayInfo());
}
