
// Animal Class 
class Animal {
  String name;
  String kingdom;
  String dob;
  int numLegs;

  // Constructor
  Animal(this.name, this.kingdom, this.dob, this.numLegs);

  // Method: Walk
  void walk(String direction) {
    if (numLegs > 0) {
      print("$name is walking towards $direction.");
    } else {
      print("$name can't walk because it has no legs.");
    }
  }

  // Method: displayInfo
  String displayInfo() {
    return "Name: $name | Kingdom: $kingdom | DOB: $dob | Legs: $numLegs";
  }
}

//  Pet Class 
class Pet extends Animal {
  String? nickname;
  int kindness;

  // Constructor without nickname
  Pet(String name, String kingdom, String dob, int numLegs)
      : nickname = null,
        kindness = 0,
        super(name, kingdom, dob, numLegs);

  // Constructor with nickname
  Pet.withNickname(
      String name, String kingdom, String dob, int numLegs, String nickname)
      : nickname = nickname,
        kindness = 100,
        super(name, kingdom, dob, numLegs);

  // Method: Kick-decrease kindness
  void kick(int value) {
    kindness -= value;
    print("${nickname ?? name} was kicked! (-$value) Kindness: $kindness");
  }

  // Method: Pet-increase kindness 
  void petAction(int value) {
    if (kindness < 0) {
      print("${nickname ?? name} is upset. Petting failed.");
    } else {
      kindness += value;
      print("${nickname ?? name} is happy! (+$value) Kindness: $kindness");
    }
  }

  // Method: Play-increase kindness
  void play(int value) {
    kindness += value;
    print("${nickname ?? name} played with you! (+$value) Kindness: $kindness");
  }
}

void main() {
  // ZOO list
  List<Animal> ZOO = [
    Animal("Lion", "Mammal", "2018-05-01", 4),
    Animal("Snake", "Reptile", "2020-07-12", 0),
    Animal("Eagle", "Bird", "2019-03-15", 2),
    Animal("Frog", "Amphibian", "2021-01-20", 4),
    Animal("Fish", "Aquatic", "2022-09-10", 0),
  ];

  print("===== ZOO =====");

  // Iterate and call methods
  for (var animal in ZOO) {
    print(animal.displayInfo());
    animal.walk("north");
    print("-------------------");
  }

  // PET_HOME list
  List<Pet> PET_HOME = [
    Pet.withNickname("Dog", "Mammal", "2021-02-10", 4, "Buddy"),
    Pet("Cat", "Mammal", "2020-06-05", 4),
    Pet.withNickname("Parrot", "Bird", "2019-11-23", 2, "Polly"),
  ];

  print("\n===== PET HOME =====");

  // Decrease kindness below 0
  PET_HOME[1].kick(50);
  PET_HOME[1].kick(100); 

  // Increase kindness above 1000
  PET_HOME[0].play(600);
  PET_HOME[0].play(500); // now > 1000

  // interactions
  PET_HOME[2].petAction(50);
  PET_HOME[2].kick(30);

  print("\n===== FINAL KINDNESS =====");

  for (var pet in PET_HOME) {
    print("${pet.nickname ?? pet.name} -> Kindness: ${pet.kindness}");
  }
}