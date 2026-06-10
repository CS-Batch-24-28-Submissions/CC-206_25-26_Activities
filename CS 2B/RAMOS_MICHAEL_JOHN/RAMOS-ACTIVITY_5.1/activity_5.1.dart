// Constructing class with constructor
// parent class
class Animal {
  // Attributes
  String name;
  String Kingdom;
  String Dob;
  int Numlegs;

  // constructor, shorthand using this
  Animal(this.name, this.Kingdom, this.Dob, this.Numlegs);

  // methods
  void walk(String direction) {
    // conditional, to print appropriate string
    if (Numlegs == 0) {
      print("$name can't walk because it has no legs\n");
    } else {
      print("$name is walking towards $direction\n");
    }
  }

  String displayInfo() {
    // multiline strings
    return """ 
    Animal Information:
    Name: $name
    Kingdom: $Kingdom
    Date of Birth: $Dob
    Number of Legs: $Numlegs
    """;
  }
}

// child class, inheritance
class Pet extends Animal {
  String? Nickname; // made nullable
  int Kindness = 0;

  void kick() {
    Kindness -= 1000;
    print(
      "You kicked $name, kindness decreased by 1000. current kindness: $Kindness\n",
    );
  }

  void pet() {
    // conditionals
    if (Kindness < 0) {
      print(
        "$name fears you, ran away when you tried to pet. Petting failed. current kindness: $Kindness\n",
      );
    } else {
      Kindness += 500;
      print(
        "You pet $name. Kindness increased by 500. current kindness: $Kindness\n",
      );
    }
  }

  void feed() {
    Kindness += 500;
    print(
      "You fed $name. Kindness increased by 500. current kindness: $Kindness\n",
    );
  }

  // Constructors
  Pet(String name, String Kingdom, String Dob, int Numlegs, this.Nickname)
    : Kindness = 100,
      super(name, Kingdom, Dob, Numlegs);
  // named constructor without nick name
  Pet.noNickname(String name, String Kingdom, String Dob, int Numlegs)
    : Kindness = 0,
      super(name, Kingdom, Dob, Numlegs);
}

void main() {
  // Lists
  // Animal objects
  List<Animal> ZOO = [
    Animal("Duck", "Animalia", "April 27, 2025", 2),
    Animal("Fish", "Animalia", "April 28, 2025", 0),
    Animal("Dog", "Animalia", "April 29, 2020", 4),
    Animal("Ant", "Animalia", "April 1, 2026", 6),
    Animal("Chicken", "Animalia", "April 2, 2020", 2),
  ];

  print("Animals:");

  // Looping
  for (Animal animal in ZOO) {
    print(animal.displayInfo());
    animal.walk("North");
  }

  // pet objects
  List<Pet> PET_HOME = [
    Pet("Dog", "Animalia", "April 1, 2006", 4, "Bespren"),
    Pet.noNickname("Duck", "Animalia", "April 27, 2025", 2),
  ];

  // call functions to change kindness levels
  PET_HOME[1].kick(); // goes below zero

  // reach above 1000
  PET_HOME[0].pet();
  PET_HOME[0].feed();
  PET_HOME[0].pet();
}
