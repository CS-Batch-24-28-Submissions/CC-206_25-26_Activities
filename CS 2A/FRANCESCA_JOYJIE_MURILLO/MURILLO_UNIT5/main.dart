// Programming Concept 1: Class and Object
class Animal {
  // Programming Concept 2: Attributes / Properties
  String name;
  String kingdom;
  String dob;
  int numlegs;

  // Programming Concept 3: Constructor
  Animal(this.name, this.kingdom, this.dob, this.numlegs);

  // Programming Concept 4: Method with Parameter
  void walk(String direction) {
    // Programming Concept 5: Conditional Statement
    if (numlegs <= 0) {
      print("$name can't walk because it has no legs.");
    } else {
      print("$name walks toward the $direction.");
    }
  }

  String displayInfo() {
    return "Name: $name | Kingdom: $kingdom | Date of Birth: $dob | Number of Legs: $numlegs";
  }
}

// Programming Concept 6: Inheritance
class Pet extends Animal {
  String nickname;
  int kindness = 0;

  // Constructor requiring nickname
  Pet(
    String name,
    String kingdom,
    String dob,
    int numlegs,
    this.nickname,
  ) : super(name, kingdom, dob, numlegs) {
    kindness = 50;
  }

  // Constructor excluding nickname
  Pet.withoutNickname(
    String name,
    String kingdom,
    String dob,
    int numlegs,
  )   : nickname = "No nickname",
        super(name, kingdom, dob, numlegs);

  void kick(int decreaseValue) {
    kindness -= decreaseValue;
    print("$nickname was kicked. Kindness decreased by $decreaseValue.");
    print("Current kindness: $kindness");
  }

  void petAnimal(int increaseValue) {
    if (kindness < 0) {
      print("Petting $nickname failed because kindness is below 0.");
    } else {
      kindness += increaseValue;
      print("$nickname was petted. Kindness increased by $increaseValue.");
      print("Current kindness: $kindness");
    }
  }

  // Programming Concept 7: Custom Method
  void feed(int increaseValue) {
    kindness += increaseValue;
    print("$nickname was fed. Kindness increased by $increaseValue.");
    print("Current kindness: $kindness");
  }

  @override
  String displayInfo() {
    return "${super.displayInfo()} | Nickname: $nickname | Kindness: $kindness";
  }
}

void main() {
  // Programming Concept 8: List
  List<Animal> ZOO = [
    Animal("Lion", "Mammalia", "2020-03-15", 4),
    Animal("Eagle", "Aves", "2021-06-10", 2),
    Animal("Snake", "Reptilia", "2019-01-20", 0),
    Animal("Frog", "Amphibia", "2022-08-05", 4),
    Animal("Spider", "Arachnida", "2023-11-01", 8),
  ];

  print("===== ZOO ANIMALS =====");

  // Programming Concept 9: Loop / Iteration
  for (Animal animal in ZOO) {
    print(animal.displayInfo());
    animal.walk("north");
    print("");
  }

  // Programming Concept 10: Object Instantiation
  List<Pet> PET_HOME = [
    Pet("Dog", "Mammalia", "2021-02-14", 4, "Buddy"),
    Pet("Cat", "Mammalia", "2022-05-30", 4, "Mingming"),
    Pet.withoutNickname("Fish", "Actinopterygii", "2023-09-12", 0),
  ];

  print("===== PET HOME =====");

  for (Pet pet in PET_HOME) {
    print(pet.displayInfo());
    pet.walk("east");
    print("");
  }

  print("===== KINDNESS TEST =====");

  PET_HOME[0].kick(100);
  PET_HOME[0].petAnimal(20);

  print("");

  PET_HOME[1].feed(1200);
  PET_HOME[1].petAnimal(100);

  print("");

  PET_HOME[2].kick(10);
  PET_HOME[2].feed(1500);

  print("");

  print("===== FINAL PET INFORMATION =====");
  for (Pet pet in PET_HOME) {
    print(pet.displayInfo());
  }
}