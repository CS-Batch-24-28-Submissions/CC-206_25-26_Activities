// Animal class: basic attributes and actions
class Animal {
  String name;
  String kingdom;
  String dob;
  int numLegs;

  Animal(this.name, this.kingdom, this.dob, this.numLegs);

  // Walk if legs > 0
  void walk(String direction) {
    if (numLegs > 0) {
      print("$name walks towards $direction.");
    } else {
      print("$name cannot walk because it has no legs.");
    }
  }

  // Show animal info
  String displayInfo() {
    return "\nAnimal Info:\nName   = $name, \nKingdom= $kingdom, \nDob    = $dob, \nLegs   = $numLegs";
  }
}

// Pet class: adds nickname + kindness
class Pet extends Animal {
  String? nickname;
  int kindness;

  // Default constructor (kindness = 0)
  Pet(String name, String kingdom, String dob, int numLegs)
      : kindness = 0,
        super(name, kingdom, dob, numLegs);

  // Constructor with nickname (kindness = 10)
  Pet.withNickname(String name, String kingdom, String dob, int numLegs, this.nickname)
      : kindness = 10,
        super(name, kingdom, dob, numLegs);

  // Decrease kindness
  void kick(int decreaseValue) {
    kindness -= decreaseValue;
    print("$name was kicked! \nKindness decreased by $decreaseValue. \nCurrent kindness: $kindness");
  }

  // Increase kindness if not negative
  void pet(int increaseValue) {
    if (kindness < 0) {
      print("\n\nPetting failed. \n$name has negative kindness.");
    } else {
      kindness += increaseValue;
      print("\n\n$name was petted! \nKindness increased by $increaseValue. \nCurrent kindness: $kindness");
    }
  }

  // Feed increases kindness
  void feed(int increaseValue) {
    kindness += increaseValue;
    print("$name was fed! Kindness increased by $increaseValue. Current kindness: $kindness");
  }
}

void main() {
  // Zoo list
  List<Animal> ZOO = [
    Animal("Lion", "Mammal", "2020/5/10", 4),
    Animal("Iguana", "Reptile", "2021/3/15", 4),
    Animal("Eagle", "Bird", "2019/8/20", 2),
    Animal("Crocodile", "Amphibian", "2022/1/5", 4),
    Animal("Shark", "Fish", "2018/11/30", 0),
  ];

  // Show zoo info
  for (var animal in ZOO) {
    print(animal.displayInfo());
    animal.walk("north");
  }

  // Pet home list
  print("\n--- PET HOME ---\n");
  List<Pet> PET_HOME = [
    Pet.withNickname("Dog", "Mammal", "2021/6/1", 4, "Willy"),
    Pet("Cat", "Mammal", "2020/9/12", 4),
    Pet.withNickname("Hamster", "Mammal", "2022/2/14", 2, "Burber"),
  ];

  // Demo kindness changes
  PET_HOME[1].kick(5);
  PET_HOME[1].pet(10);

  PET_HOME[0].feed(995);
  PET_HOME[0].pet(20);
  
  // Show kindness of pets
  print("\n---KINDNESS OF PETS---\n");
  for (var pet in PET_HOME) {
    print("${pet.name} (${pet.nickname ?? "No nickname"}) kindness: ${pet.kindness}");
  }
}