//parent class: Animal
class Animal {
  //atributes
  String name;
  String kingdom;
  String dob;
  int numlegs;

  //constructor
  Animal({
    required this.name,     //Data types and required parameters
    required this.kingdom,
    required this.dob,
    required this.numlegs,
  });

  //method: walk
  void walk(String direction) {     //method with parameter
    if (numlegs == 0) {
      print("$name can't walk because it has no legs.");
    } else {
      print("$name is walking $direction.");
    }
  }

  //method: displayInfo
  String displayInfo() {   
    return '''
    Animal Information:
    Name     : $name
    Kingdom  : $kingdom
    DOB      : $dob
    Num Legs : $numlegs
    ''';
  }
}


//New class: Pet that inherits from Animal
class Pet extends Animal {
  String? nickname;
  int kindness = 0;

  //constructor 1: With Nickname
  Pet.withNickname({
    required String name,     //Data types and required parameters
    required String kingdom,
    required String dob,
    required int numlegs,
    required this.nickname,
  }) : super(name: name, kingdom: kingdom, dob: dob, numlegs: numlegs) {
    kindness = 15;   // positive value as required
  }

  //constructor 2: Without Nickname
  Pet({
    required String name,
    required String kingdom,
    required String dob,
    required int numlegs,
  }) : super(name: name, kingdom: kingdom, dob: dob, numlegs: numlegs) {
    nickname = null;
    kindness = 0;
  }

  // Method: Kick - decreases kindness
  void kick(int amount) {
    kindness -= amount;
    print("$name was kicked! Kindness decreased by $amount. Current: $kindness");
  }

  // Method: Pet - increases kindness (fails if below 0)
  void pet(int amount) {
    if (kindness < 0) {   //conditional statement to check kindness level
      print("Failed to pet $name. The pet is too upset.");
    } else {
      kindness += amount;
      print("$name was petted! Kindness increased by $amount. Current: $kindness");
    }
  }

  //additional Method: GiveTreat (increases kindness)
  void giveTreat(int amount) {
    kindness += amount;
    print("$name received a treat! Kindness increased by $amount. Current: $kindness");
  }

  //display Pet info
  @override
  String displayInfo() {                  //method overriding
    String nick = nickname ?? "None";
    return '''
    Pet Information:
    Name      : $name
    Nickname  : $nick
    Kingdom   : $kingdom
    DOB       : $dob
    Num Legs  : $numlegs
    Kindness  : $kindness
    ''';
  }
}

// =============================================
// QUESTION 3: ZOO and PET_HOME Implementation
// =============================================

//main function to test the classes
void main() {
  print("=== Animal Test ===");
  Animal dog = Animal(    //creating an instance of Animal
    name: "Spots",
    kingdom: "Animalia",
    dob: "2022-03-10",
    numlegs: 4,
  );

  dog.walk("forward");    //testing walk method
  dog.walk("left");
  print(dog.displayInfo());

  print("\n=== Pet Test ===");

  // Pet with nickname
  Pet cat = Pet.withNickname(   //creating an instance of Pet using the constructor with nickname
    name: "Whiskers",
    kingdom: "Animalia",
    dob: "2023-05-20",
    numlegs: 4,
    nickname: "Puss in Boots",
  );

  print(cat.displayInfo());

  cat.pet(10);      // testing pet method
  cat.giveTreat(15);
  cat.kick(8);
  cat.pet(5);
  cat.kick(25);     // kindness becomes negative
  cat.pet(10);      // should fail

  print("\n=== Pet without nickname ===");    //creating an instance of Pet using the constructor without nickname
  Pet snake = Pet(
    name: "Medusa",
    kingdom: "Animalia",
    dob: "2022-11-15",
    numlegs: 0,
  );

  print(snake.displayInfo());   // testing displayInfo method
  snake.giveTreat(20);


  // 3. ZOO List - Containing 5 different Animal objects
  print("\n=== QUESTION 3: ZOO and PET_HOME ===");

  List<Animal> ZOO = [
    Animal(name: "Lion", kingdom: "Animalia", dob: "2018-05-12", numlegs: 4),
    Animal(name: "Elephant", kingdom: "Animalia", dob: "2015-03-20", numlegs: 4),
    Animal(name: "Snake", kingdom: "Animalia", dob: "2020-11-08", numlegs: 0),
    Animal(name: "Eagle", kingdom: "Animalia", dob: "2019-07-15", numlegs: 2),
    Animal(name: "Kangaroo", kingdom: "Animalia", dob: "2021-01-30", numlegs: 2),
  ];

  print("\nA. ZOO contains 5 different Animal objects:");

  // i. Iterate through ZOO and call each of their functions
  for (int i = 0; i < ZOO.length; i++) {
    print("\n--- Animal ${i + 1}: ${ZOO[i].name} ---");
    ZOO[i].walk("forward");        // Call walk method
    print(ZOO[i].displayInfo());   // Call displayInfo method
  }

  // B. PET_HOME List - Containing 3 different Pet objects
  List<Pet> PET_HOME = [
    Pet.withNickname(
      name: "Spots",
      kingdom: "Animalia",
      dob: "2022-06-10",
      numlegs: 4,
      nickname: "Good Boy",
    ),
    Pet.withNickname(
      name: "Whiskers",
      kingdom: "Animalia",
      dob: "2023-02-18",
      numlegs: 4,
      nickname: "Puss in Boots",
    ),
    Pet(
      name: "Medusa",
      kingdom: "Animalia",
      dob: "2021-09-05",
      numlegs: 0,
    ),
  ];

  print("\nB. PET_HOME contains 3 different Pet objects:");

  // Show initial status of pets
  for (var pet in PET_HOME) {
    print(pet.displayInfo());
  }

  print("\nModifying kindness values as required:");

  //Decrease the kindness value of 1-2 pets below 0 (negative values)
  print("\nDecreasing kindness to negative:");
  PET_HOME[0].kick(100);   //Spots becomes negative
  PET_HOME[2].kick(50);    //Medusa becomes negative

  //Increase the kindness value of 1-2 pets above 1000
  print("\nIncreasing kindness above 1000:");
  PET_HOME[1].giveTreat(1200);   //Whiskers kindness > 1000
  PET_HOME[1].pet(100);          //Further increase

  print("\nFinal Status of PET_HOME:");
  for (var pet in PET_HOME) {
    print(pet.displayInfo());
  }

  print("\n=== End of Program ===");
}