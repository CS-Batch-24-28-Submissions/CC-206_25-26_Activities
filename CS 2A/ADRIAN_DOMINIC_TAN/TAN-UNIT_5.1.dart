// [CONCEPT] ENUM
enum AnimalKingdom {
  MAMMAL,
  BIRD,
  REPTILE,
  AMPHIBIAN,
  FISH,
  INSECT,
  ARACHNID,
  MOLLUSK,
  CRUSTACEAN,
  OTHER
}

// [CONCEPT] CLASS + CONSTRUCTOR
class Animal {
  final String Name;
  final AnimalKingdom Kingdom;
  final DateTime Dob;
  final int Numlegs;

  Animal(this.Name, this.Kingdom, this.Dob, this.Numlegs);

  void Walk(String direction) {
    // [CONCEPT] CONDITIONAL
    if (Numlegs == 0) {
      print("The $Name can't walk.");
    } else {
      print("The $Name is walking to the $direction.");
    }
  }

  String displayInfo() {
    // [CONCEPT] MULTILINE STRING
    return """
Name: $Name
Kingdom: $Kingdom
Date of Birth: ${Dob.toLocal()}
Number of Legs: $Numlegs
""";
  }
}

// [CONCEPT] CLASS + NAMED CONSTRUCTOR
class Pet {
  String? Nickname;
  int Kindness = 0;

  Pet();

  // [CONCEPT] NAMED CONSTRUCTOR
  Pet.withNickname(this.Nickname) {
    Kindness = 100;
  }

  void Kick(int amount) {
    Kindness -= amount;
    print("$Nickname's kindness decreased by $amount. Current kindness: $Kindness");
  }

  void pet(int amount) {
    // [CONCEPT] CONDITIONAL
    if (Kindness < 0) {
      print("Failed to pet $Nickname. Kindness is negative.");
    } else {
      Kindness += amount;
      print("$Nickname's kindness increased by $amount. Current kindness: $Kindness");
    }
  }

  void feed(int numOfTreats) {
    Kindness += numOfTreats * 2;
    print("$Nickname has been fed with $numOfTreats treats. Current kindness: $Kindness");
  }
}

void main() {
  // [CONCEPT] LIST
  var ZOO = [
    Animal("Lion", AnimalKingdom.MAMMAL, DateTime(2018, 5, 10), 4),
    Animal("Eagle", AnimalKingdom.BIRD, DateTime(2020, 3, 15), 2),
    Animal("Snake", AnimalKingdom.REPTILE, DateTime(2019, 7, 20), 0),
    Animal("Frog", AnimalKingdom.AMPHIBIAN, DateTime(2021, 1, 5), 4),
    Animal("Shark", AnimalKingdom.FISH, DateTime(2017, 9, 12), 0),
  ];

  // [CONCEPT] SPREAD OPERATOR
  var ZOO1 = [...ZOO];

  print("-=-=-=- Zoo -=-=-=-");

  // [CONCEPT] LOOP (FOR-IN)
  for (var animal in ZOO1) {
    print(animal.displayInfo());
    animal.Walk("north");
    print("-------------------");
  }

  var PET_HOME = [
    Pet.withNickname("Buddy"),
    Pet.withNickname("Milo"),
    Pet(),
  ];

  print("\n-=-=-=- Pet Home -=-=-=-");

  PET_HOME[0].Kick(200);
  PET_HOME[2].Kick(50);

  PET_HOME[1].feed(600);
  PET_HOME[1].pet(100);

  print("\n-=-=-=- Pet Home Details -=-=-=-");

  for (var pet in PET_HOME) {
    print("Nickname: ${pet.Nickname}, Kindness: ${pet.Kindness}");
  }
}