// Concept 1: Classes and Objects (Defining blueprints for data)
class Animal {
  // Concept 2: Type Annotations (Explicitly declaring variable types)
  String name;
  String kingdom;
  String dob;
  int numLegs;

  // Constructor for the Animal class
  Animal(this.name, this.kingdom, this.dob, this.numLegs);

  // Concept 3: Methods (Functions inside a class)
  void walk(String direction) {
    // Concept 4: Conditionals (If/Else statements to control flow)
    if (numLegs > 0) {
      // Concept 5: String Interpolation (Injecting variables into strings)
      print('$name walks towards the $direction.');
    } else {
      print('$name has no legs and cannot walk.');
    }
  }

  String displayInfo() {
    return 'Animal Info -> Name: $name | Kingdom: $kingdom | DOB: $dob | Legs: $numLegs';
  }
}

// Concept 6: Class Inheritance (Using 'extends' to inherit properties from Animal)
class Pet extends Animal {
  // Concept 7: Null Safety (Using '?' to indicate a variable can be null)
  String? nickname;
  int kindness = 0;

  // Concept 8: Named Constructors (Creating multiple ways to initialize an object)
  
  // Constructor 1: Requires a nickname and sets initial kindness to a positive number.
  Pet.withNickname(String name, String kingdom, String dob, int numLegs, this.nickname) 
      : kindness = 50, // Initial positive value
        super(name, kingdom, dob, numLegs);

  // Constructor 2: Excludes the nickname. Kindness defaults to 0.
  Pet(String name, String kingdom, String dob, int numLegs) 
      : super(name, kingdom, dob, numLegs);

  // Method to decrease kindness
  void kick(int decreaseValue) {
    kindness -= decreaseValue;
    print('You kicked $name. Kindness decreased by $decreaseValue. Current kindness: $kindness');
  }

  // Method to pet the animal (Renamed from 'Pet' to avoid constructor name conflict)
  void petGesture(int increaseValue) {
    if (kindness < 0) {
      print('Failed to pet $name. The pet is too scared or angry because kindness is below 0.');
    } else {
      kindness += increaseValue;
      print('You petted $name. Kindness increased by $increaseValue. Current kindness: $kindness');
    }
  }

  // Custom Method to alter kindness
  void feed(int foodValue) {
    kindness += foodValue;
    String petName = nickname ?? name; // Use nickname if available, otherwise use name
    print('You fed $petName their favorite meal! Kindness increased by $foodValue. Current kindness: $kindness');
  }
}

void main() {
  print('--- PART 3a: ZOO ANIMALS ---');
  // Concept 9: Lists (Collections to store multiple objects)
  List<Animal> zoo = [
    Animal('Lion', 'Mammalia', '2018-05-14', 4),
    Animal('Python', 'Reptilia', '2020-11-02', 0),
    Animal('Eagle', 'Aves', '2019-07-22', 2),
    Animal('Shark', 'Chondrichthyes', '2015-03-10', 0),
    Animal('Tarantula', 'Arachnida', '2022-01-30', 8),
  ];

  // Concept 10: Iteration (Using a for-in loop to traverse the list)
  for (var animal in zoo) {
    print(animal.displayInfo());
    animal.walk('North');
    print('-------------------------');
  }

  print('\n--- PART 3b: PET HOME ---');
  List<Pet> petHome = [
    Pet.withNickname('Dog', 'Mammalia', '2021-04-10', 4, 'Buddy'),
    Pet('Stray Cat', 'Mammalia', '2022-09-15', 4),
    Pet.withNickname('Parrot', 'Aves', '2023-02-20', 2, 'Polly')
  ];

  print('\nInitial Pet Status:');
  for (var pet in petHome) {
    print('${pet.nickname ?? pet.name} - Kindness: ${pet.kindness}');
  }

  print('\n--- Decreasing kindness below 0 ---');
  // The Stray Cat starts at 0 (Constructor 2). Kicking it by 10 will drop it below 0.
  petHome[1].kick(10); 
  // Attempting to pet it should now fail.
  petHome[1].petGesture(5); 

  print('\n--- Increasing kindness above 1000 ---');
  // Buddy starts at 50. Let's increase it massively.
  petHome[0].feed(500);
  petHome[0].petGesture(460); // Total: 50 + 500 + 460 = 1010
  
  // Polly starts at 50. Let's increase it massively too.
  petHome[2].feed(600);
  petHome[2].petGesture(400); // Total: 50 + 600 + 400 = 1050

  print('\nFinal Pet Status:');
  for (var pet in petHome) {
    print('${pet.nickname ?? pet.name} - Final Kindness: ${pet.kindness}');
  }
}