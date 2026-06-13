// [1] Class
class Animal {
  String name;
  String kingdom;
  int numLegs;

// [2️.] Constructor
  Animal({required this.name, required this.kingdom, required this.numLegs});

// [3️.] Method 
  void walk(String direction) {
    if (numLegs > 0) {
      print("$name walks towards $direction");
    } else {
      print("$name cannot walk");
    }
  }

// [4.] Fat Arrow Function (=>)
  String displayInfo() => "$name belongs to $kingdom with $numLegs legs";
}

// [5️.] Inheritance
class Pet extends Animal {
  String nickname;
  int kindness;

// [6️.] Named Constructor
  Pet.withNickname({
    required String name,
    required String kingdom,
    required int numLegs,
    required this.nickname,
  })  : kindness = 100,
        super(name: name, kingdom: kingdom, numLegs: numLegs);

  Pet({
    required String name,
    required String kingdom,
    required int numLegs,
  })  : nickname = "No nickname",
        kindness = 50,
        super(name: name, kingdom: kingdom, numLegs: numLegs);
}

void main() {
// [7️.] List (Collection)
  List<Animal> ZOO = [
    Animal(name: "Lion", kingdom: "Mammal", numLegs: 4),
    Animal(name: "Snake", kingdom: "Reptile", numLegs: 0),
    Animal(name: "Bird", kingdom: "Avian", numLegs: 2),
    Animal(name: "Frog", kingdom: "Amphibian", numLegs: 4),
    Animal(name: "Fish", kingdom: "Aquatic", numLegs: 0),
  ];

// [8️.] For each Loop
  for (var animal in ZOO) {
    animal.walk("north");
    print(animal.displayInfo());
  }

  List<Pet> PET_HOME = [
    Pet.withNickname(name: "Hudson", kingdom: "Mammal", numLegs: 4, nickname: "Langga"),
    Pet(name: "Dorian", kingdom: "Mammal", numLegs: 4),
  ];

// [9.] CONDITIONALS (IF)
  PET_HOME[0].kindness = -10;
  PET_HOME[1].kindness = 1500;

  for (var pet in PET_HOME) {
    if (pet.kindness < 0) {
      print("${pet.name} is aggressive!");
    } else if (pet.kindness > 1000) {
      print("${pet.name} is too friendly!");
    } else {
      print("${pet.name} doesn't care.");
    }
  }
}

